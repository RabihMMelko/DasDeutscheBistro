const db = require("./db");
const config = require("../config");

const tableName = "cart";

const addCart = async (data) => {
  /* 
    if(first item){
        create new cart
    }
    check existence of item
    if (item in cart){
        update quantity
    }
    else{
        create new cart item
    }
    
  */
  
  let sqlInitCart = `INSERT INTO dasdeutschebistro.carts(
       user_id,
       cart_status,
       cart_date,
       created_by 
    )
    SELECT 1,
           STATUS_ID,
           CURRENT_DATE,
          -7
      FROM DASDEUTSCHEBISTRO.REF_STATUS
    WHERE STATUS_NAME = 'ACTIVE'`;

  let cartId;

  const initCartRes = await db.query(sqlInitCart);
  console.log(initCartRes);
  cartId = initCartRes.insertId;

  let sqlItems = `INSERT INTO dasdeutschebistro.cart_items(
                      cart_id,
                      meal_id,
                      meal_qty
    ) VALUES (?,?,?)`;

  let items = [];

  for (key in data.orderedItems) {
    console.log("Key:", key);
    let appendDate = [
      cartId,
      data.orderedItems[key].id,
      data.orderedItems[key].amount,
    ];
    console.log("insertObj: ", appendDate);
    items.push(appendDate);

    const cartItemResult = await db.query(sqlItems, appendDate);
    console.log(cartItemResult.affectedRows, " items inserted");
  }

  let sqlOrder = `INSERT INTO dasdeutschebistro.orders (
          order_date,
          order_cart,
          delivery_zip,
          delivery_street,
          delivery_city,
          created_by
      ) VALUES (?,?,?,?,?,?)`;

  const orderDate = new Date();
  const newOrderDate =
    orderDate.getFullYear() +
    "-" +
    String(orderDate.getMonth() + 1).padStart(2, "0") +
    "-" +
    String(orderDate.getDate()).padStart(2, "0");
  let orderValues = [
    newOrderDate,
    cartId,
    data.user.postalCode,
    data.user.addr,
    data.user.ville,
    -7,
  ];
  console.log(orderValues);
  const orderResult = await db.query(sqlOrder, orderValues);

  console.log(orderResult.affectedRows, " orders inserted");

  return;
};

const orderHistory = async (id) => {
  let sql = `SELECT O.ORDER_ID,
                    O.ORDER_DATE,
                    CONCAT(O.DELIVERY_STREET,
                            ', ',
                            O.DELIVERY_ZIP,
                            ', ',
                            O.DELIVERY_CITY) AS DELIVERY_ADDRESS,
                    SUM(CI.MEAL_QTY * MEAL_PRICE) AS TOTAL_ORDER_AMT
                FROM
                    DASDEUTSCHEBISTRO.ORDERS O,
                    DASDEUTSCHEBISTRO.CART_ITEMS CI,
                    DASDEUTSCHEBISTRO.CARTS C,
                    DASDEUTSCHEBISTRO.MEALS M
                WHERE O.ORDER_CART = CI.CART_ID
                  AND CI.MEAL_ID = M.MEAL_ID
                  AND C.CART_ID = CI.CART_ID
                  AND C.USER_ID = ?
                GROUP BY O.ORDER_ID ,
                         O.ORDER_DATE , 
                         CONCAT(O.DELIVERY_STREET,
                                ', ',
                                O.DELIVERY_ZIP,
                                ', ',
                                O.DELIVERY_CITY)`;

  const rows = await db.query(sql, id, (err, result) => {
    if (err) throw err;
  });

  return { rows };
};

module.exports = {
  newOrder,
  orderHistory,
};

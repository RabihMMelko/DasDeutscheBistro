import { useContext, useState } from "react";

import classes from "./Cart.module.css";
import Modal from "../UI/Modal";
import CartItem from "./CartItem";
import CartContext from "../../store/cart-context";
import Checkout from "./Checkout";
import axios from "axios";

const Cart = (props) => {
  const [isCheckout, setIsCheckout] = useState(false);
  const cartCtx = useContext(CartContext);

  const totalAmount = `LBP${cartCtx.totalAmount.toFixed(0)}`;
  const hasItems = cartCtx.items.length > 0;

  console.log(cartCtx.items);
  const cartItemRemoveHandler = (id) => {
    cartCtx.removeItem(id);
  };

  const cartItemAddHandler = (item) => {
    cartCtx.addItem({ ...item, amount: 1 });
  };

  const orderHandler = () => {
    setIsCheckout(true);
  };

  

  const commandeHandler = (userData) => {

    const orderData = {
      user: userData,
      orderedItems: cartCtx.items
    };
    axios.post(
      "http://localhost:3001/ordersMgmt/addOrder",
      orderData
    );
  };

  const cartItems = (
    <ul className={classes["cart-items"]}>
      {cartCtx.items.map((item) => (
        <CartItem
          key={item.id}
          name={item.name}
          amount={item.amount}
          price={item.price}
          onAdd={cartItemAddHandler.bind(null, item)}
          onRemove={cartItemRemoveHandler.bind(null, item.id)}
        />
      ))}
    </ul>
  );

  const cartControls = (
    <div className={classes.actions}>
      <button onClick={props.onClose} className={classes["button--alt"]}>
        Fermer
      </button>
      {hasItems && (
        <button onClick={orderHandler} className={classes.button}>
          Commander
        </button>
      )}
    </div>
  );
  return (
    <Modal onClose={props.onClose}>
      {cartItems}
      <div className={classes.total}>
        <span>Prix Total</span>
        <span>{totalAmount}</span>
      </div>
      {isCheckout && (
        <Checkout onConfirm={commandeHandler} onCancel={props.onClose} />
      )}
      {!isCheckout && cartControls}
    </Modal>
  );
};
export default Cart;

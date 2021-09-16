const db = require("./db");
const config = require("../config");

const table_name = "users";

//login
const login = async (login, pass) => {
  sql = `SELECT 
        U.user_id,
        CONCAT(u.user_fname, ' ', u.user_lname) AS user_name,
        c.cur_iso_code,
        c.cur_id
      FROM
        DASDEUTSCHEBISTRO.USERS U,
        DASDEUTSCHEBISTRO.CURRENCIES C
      WHERE
        U.user_currency = C.cur_id
            AND UPPER(U.user_login) = UPPER(?)
            AND U.user_password = ?`;
  const rows = await db.query(sql, [login, pass]);
  console.log(rows)
  return { rows };
};

//signup
const signup = async (registerData) => {
  //check if user exists
  sqlCheckExists = `SELECT COUNT(1)
                      FROM DASDEUTSCHEBISTRO.USERS U
                     WHERE UPPER(U.USER_LOGIN) = UPPER(?)`;

  const exist = await db.query(sqlCheckExists, [registerData.userLogin]);

  //if no create the user
  if (exist[0] == 0) {
    sqlRegisterUser = `INSERT INTO DASDEUTSCHEBISTRO.USERS(
                        USER_LOGIN,
                        USER_PASSWORD,
                        USER_FNAME,
                        USER_LNAME,
                        USER_DOB,
                        USER_CURRENCY
    ) SELECT ?,
            ?,
            ?,
            ?,
            ?,
            C.CUR_ID
       FROM DASDEUTSCHEBISTRO.CURRENCIES C
      WHERE A.CUR_ISO_CODE = 'LBP'`;

    const respSignup = await db.query(sqlRegisterUser, [
      registerData[userLogin],
      registerData[userPass],
      registerData[userFname],
      registerData[userLname],
      registerData[userDoB],
    ]);

    return respSignup.affectedRows;
  }
  //If yes, return something
  return 0;
  
};

module.exports = {
  login,
  signup,
};

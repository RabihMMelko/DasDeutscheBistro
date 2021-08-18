import React, { useState } from "react";
import Header from "./components/Layout/Header";
import Meals from "./components/Meals/Meals";
import Cart from "./components/Cart/Cart";
import CartProvider from "./store/CartProvider";
import axios from "axios";
import Login from "./components/Login/Login";

function App() {
  const [isCartVisible, setIsCartVisible] = useState(false);
  const [isLoginVisible, setIsLoginVisible] = useState(true);
  const [userDetails, setUserDetails] = useState(null);

  const showCartHandler = () => {
    setIsCartVisible(true);
  };

  const hideCartHandler = () => {
    setIsCartVisible(false);
  };

  const showLoginHandler = () => {
    setIsLoginVisible(true);
  };

  const hideLoginHandler = () => {
    setIsLoginVisible(false);
  };

  const loginHandler = async (login, pass) => {
    const authData = { uname: login, password: pass };

    const response = axios.post("http://localhost:3001/access/Login", {
      authData,
    });

    if (!response.ok) {
      throw new Error(
        "Une erreur est survenue... Veuillez retourner plus tard"
      );
    }

    const responseData = await response;
    const userDetail = []

    if (responseData.data.rows.length > 0) {
      for (const key in responseData.data.rows) {
        let user = responseData.data.rows[key];
        userDetail.push({
          id: user.user_id,
          name: user.user_name,
          isoCur: user.cur_iso_code,
          idCur: user.cur_id,
        });
      }

      setUserDetails(userDetail);
      setIsLoginVisible(false);
      setIsCartVisible(true);
    }
  };

  

  return (
    
    <CartProvider user = {userDetails}>
      
      {isCartVisible && <Cart onClose={hideCartHandler} />}
      {isLoginVisible && <Login onShowLogin = {showLoginHandler} onHideLogin = {hideLoginHandler} onLogin = {loginHandler}/>}
      <Header onShowCart={showCartHandler} onHideCart={hideCartHandler} />
      <main>
        <Meals />
      </main>
    </CartProvider>
  );
}

export default App;

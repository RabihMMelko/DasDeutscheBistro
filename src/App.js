import React, { useState, useEffect } from "react";
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

  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [isIncorrectLogin, setIsIncorrectLogin] = useState(false)

  useEffect(() => {
    const storedUserLoggedInInformation = localStorage.getItem("isLoggedIn");

    if (storedUserLoggedInInformation === "1") {
      setIsLoggedIn(true);
      setIsIncorrectLogin(false);
    }
  }, []);

 

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

  const logoutHandler = () => {
    localStorage.removeItem("isLoggedIn");
    setIsLoggedIn(false);
  };

  const loginHandler = async (log, pass) => {
    const authData = { userName: log, password: pass };

    const response = axios.post("http://localhost:3001/login", authData);

    if (response.ok) {
      setIsIncorrectLogin();
      
    }

    const responseData = await response;
    const userDetail = [];

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

      localStorage.setItem("isLoggedIn", "1");
      setUserDetails(userDetail);
      setIsLoginVisible(false);
      setIsLoggedIn(true)
    }
  };

  return (
    <CartProvider user={userDetails}>
      {isCartVisible && <Cart onClose={hideCartHandler}/>}
      {!isLoggedIn && (
        <Login
          onShowLogin={showLoginHandler}
          onHideLogin={hideLoginHandler}
          onLogin={loginHandler}
          
        />
      )}
      <Header onShowCart={showCartHandler} onHideCart={hideCartHandler} isLoggedIn = {isLoggedIn} onLogout = {logoutHandler} />
      <main>
        <Meals />
      </main>
    </CartProvider>
  );
}

export default App;

import React, { useState, useEffect } from "react";
import axios from "axios";

//Will contain a component
const LoginContext = React.createContext({
  isLoggedIn: false,
  onLogout: () => {},
  onLogin: async(userName, password) => {}
});

export const LoginContextProvider = (props) => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  useEffect(() => {
    const storedUserLoggedInInformation = localStorage.getItem("isLoggedIn");

    if (storedUserLoggedInInformation === "1") {
      setIsLoggedIn(true);
    }
  }, []);

  const logoutHandler = () => {
    // localStorage.removeItem("isLoggedIn");
    // setIsLoggedIn(false);
    console.log("Logout")
  };

  const loginHandler =  async (userName, password) => {
    console.log("I just got triggered");
    const loginDetails = { userName: userName, password: password };
    console.log(loginDetails);
    const response = axios.post("http://localhost:3001/login", loginDetails);

    if (response.ok) {
      throw new Error(
        "Une erreur est survenue... Veuillez retourner plus tard"
      );
    }

    const responseData =  await response;

    console.log("RESPONSE", responseData);

    if (responseData.data.rows.length > 0) {
      setIsLoggedIn(true);
      props.onClose();
    }
  };

  

  return (
    <LoginContext.Provider value={{
      isLoggedIn: isLoggedIn,
      onLogout: logoutHandler,
      onLogin: loginHandler
    }}>
      {props.children}
    </LoginContext.Provider>
  );
};

export default LoginContext;

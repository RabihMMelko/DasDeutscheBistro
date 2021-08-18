import React, { useState, useEffect } from "react";

//Will contain a component
const RegisterContext = React.createContext({
  onSignup: (userName, fname, lname, email, password) => {},
});

export const AuthContextProvider = (props) => {
  
  return (
    <LoginContext.Provider
      value={{
        onSignup: signupHandler
      }}
    >
      {props.children}
    </LoginContext.Provider>
  );
};

export default LoginContext;

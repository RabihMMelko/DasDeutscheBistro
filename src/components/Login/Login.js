import React, { useState, useEffect, useReducer, useContext } from "react";

//import Card from "../UI/Card";
import Modal from "../UI/Modal";
import classes from "./Login.module.css";
import Button from "../UI/Button/Button";
//import LoginContext, { LoginContextProvider } from "./LoginContext";

//Won't need component data so can do it here
const loginUserReducer = (state, action) => {
  if (action.type === "USER_INPUT") {
    return { value: action.val, isValid: action.val.length > 1 };
  }

  if (action.type === "INPUT_BLUR") {
    return { value: state.value, isValid: state.value.length > 1 };
  }

  return { value: "", isValid: false };
};

const loginPasswordReducer = (state, action) => {
  if (action.type === "USER_INPUT") {
    return { value: action.val, isValid: action.val.trim().length >= 8 };
  }

  if (action.type === "INPUT_BLUR") {
    return { value: state.value, isValid: state.value.trim().length >= 8 };
  }

  return { value: "", isValid: false };
};

const Login = (props) => {
  // const [enteredEmail, setEnteredEmail] = useState("");
  // const [emailIsValid, setEmailIsValid] = useState();
  // const [enteredPassword, setEnteredPassword] = useState("");
  // const [passwordIsValid, setPasswordIsValid] = useState();
  const [loginFormIsValid, setloginFormIsValid] = useState(false);

  const [loginUserState, dispatchLoginUser] = useReducer(loginUserReducer, {
    value: "",
    isValid: false,
  });

  const [loginPasswordState, dispatchLoginPassword] = useReducer(
    loginPasswordReducer,
    {
      value: "",
      isValid: false,
    }
  );

  //const logCtx = useContext(LoginContext);

  
  //object destruct
  const { isValid: userIsValid } = loginUserState;
  const { isValid: passwordIsValid } = loginPasswordState;

  useEffect(() => {
    const identifier = setTimeout(() => {
      setloginFormIsValid(userIsValid && passwordIsValid);
    }, 500);

    return () => {
      clearTimeout(identifier);
    };
  }, [userIsValid, passwordIsValid]);

  const loginEmailChangeHandler = (event) => {
    dispatchLoginUser({ type: "USER_INPUT", val: event.target.value });

    // setFormIsValid(event.target.value.length > 1 && loginPasswordState.isValid);
  };

  const loginPasswordChangeHandler = (event) => {
    dispatchLoginPassword({ type: "USER_INPUT", val: event.target.value });
    setloginFormIsValid(
      loginUserState.isValid && event.target.value.trim().length >= 8
    );
  };

  const validateLoginEmailHandler = () => {
    dispatchLoginUser({ type: "INPUT_BLUR" });
  };

  const validateLoginPasswordHandler = () => {
    dispatchLoginPassword({ type: "INPUT_BLUR" });
  };

  const loginSubmitHandler = (event) => {
    event.preventDefault();
    
    console.log(loginUserState.value, loginPasswordState.value);
    props.onLogin(loginUserState.value,loginPasswordState.value)
  };

  return (
    
    <Modal onClose = {props.onHideLogin}>
      <div className={classes["form-wrapper"]}>
        <h4>De retour? Veuillez vous connecter</h4>
        <form onSubmit={loginSubmitHandler}>
          <div
            className={`${classes.control} ${
              loginUserState.isValid === false ? classes.invalid : ""
            }`}
          >
            <label htmlFor="loginUser">Utilisateur</label>
            <input
              type="text"
              id="loginUser"
              value={loginUserState.value}
              onChange={loginEmailChangeHandler}
              onBlur={validateLoginEmailHandler}
            />
          </div>
          <div
            className={`${classes.control} ${
              loginPasswordState.isValid === false ? classes.invalid : ""
            }`}
          >
            <label htmlFor="password">Mot de Passe</label>
            <input
              type="password"
              id="loginPassword"
              value={loginPasswordState.value}
              onChange={loginPasswordChangeHandler}
              onBlur={validateLoginPasswordHandler}
            />
          </div>
          <div className={classes.actions}>
            <Button
              type="submit"
              className={classes.btn}
              disabled={!loginFormIsValid}
            >
              Se Connecter
            </Button>
          </div>
        </form>
      </div>
    </Modal>
  );
};

export default Login;

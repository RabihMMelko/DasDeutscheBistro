import React, { useState, useEffect, useReducer, useContext } from "react";

//import Card from "../UI/Card";
import Modal from "../UI/Modal";
import classes from "./Register.module.css";
import Button from "../UI/Button/Button";
import RegisterContext from "./RegisterContext";

//Won't need component data so can do it here
const registerUserReducer = (state, action) => {
  if (action.type === "USER_INPUT") {
    return { value: action.val, isValid: action.val.length > 1 };
  }

  if (action.type === "INPUT_BLUR") {
    return { value: state.value, isValid: state.value.length > 1 };
  }

  return { value: "", isValid: false };
};

const registerFirstNameReducer = (state, action) => {
    if (action.type === "USER_INPUT") {
      return { value: action.val, isValid: action.val.length > 1 };
    }
  
    if (action.type === "INPUT_BLUR") {
      return { value: state.value, isValid: state.value.length > 1 };
    }
  
    return { value: "", isValid: false };
  };

  const registerLastNameReducer = (state, action) => {
    if (action.type === "USER_INPUT") {
      return { value: action.val, isValid: action.val.length > 1 };
    }
  
    if (action.type === "INPUT_BLUR") {
      return { value: state.value, isValid: state.value.length > 1 };
    }
  
    return { value: "", isValid: false };
  };

const registerPasswordReducer = (state, action) => {
  if (action.type === "USER_INPUT") {
    return { value: action.val, isValid: action.val.trim().length > 6 };
  }

  if (action.type === "INPUT_BLUR") {
    return { value: state.value, isValid: state.value.trim().length > 6 };
  }

  return { value: "", isValid: false };
};


const registerEmailReducer = (state, action) => {
  if (action.type === "USER_INPUT") {
    return { value: action.val, isValid: action.val.includes('@')};
  }

  if (action.type === "INPUT_BLUR") {
    return { value: state.value, isValid: state.value.includes('@') };
  }

  return { value: "", isValid: false };
};


const Register = (props) => {
  const [registerFormIsValid, setregisterFormIsValid] = useState(false);


  const [registerUserState, dispatchRegisterUser] = useReducer(registerUserReducer, {
    value: "",
    isValid: false,
  });

  const [registerPasswordState, dispatchLoginPassword] = useReducer(registerPasswordReducer, {
    value: "",
    isValid: false,
  });

  const regCtx = useContext(RegisterContext);

  useEffect(() => {
    console.log("EFFECT RUNNING");

    return () => {
      console.log("EFFECT CLEANUP");
    };
  }, []);

  //object destruct
  const { isValid: userIsValid } = registerUserState;
  const { isValid: passwordIsValid } = registerPasswordState;

  useEffect(() => {
    const identifier = setTimeout(() => {
      console.log("Checking form validity!");
      setregisterFormIsValid(emailIsValid && passwordIsValid);
    }, 500);

    return () => {
      console.log("CLEANUP");
      clearTimeout(identifier);
    };
  }, [emailIsValid, passwordIsValid]);

  const registerEmailChangeHandler = (event) => {
    dispatchRegisterUser({ type: "USER_INPUT", val: event.target.value });

    // setFormIsValid(event.target.value.length > 1 && registerPasswordState.isValid);
  };

  const registerPasswordChangeHandler = (event) => {
    dispatchLoginPassword({ type: "USER_INPUT", val: event.target.value });
    setregisterFormIsValid(
      registerUserState.isValid && event.target.value.trim().length > 6
    );
  };

  const validateRegisterUserHandler = () => {
    dispatchRegisterUser({ type: "INPUT_BLUR" });
  };

  const validateLoginPasswordHandler = () => {
    dispatchLoginPassword({ type: "INPUT_BLUR" });
  };

  const registerSubmitHandler = (event) => {
    event.preventDefault();
    authCtx.onLogin(registerUserState.value, registerPasswordState.value);
  };

  const signupSubmitHandler = (event) => {
    event.preventDefault();
    authCtx.onSignup(registerUserState.value, registerPasswordState.value);
  };

  return (
    <Modal onClose={props.onClose}>
      <div className={classes["form-wrapper"]}>
        <h4>Nouvel Utilisateur? Veuillez vous enregister</h4>
        <form onSubmit={signupSubmitHandler}>
          <div
            className={`${classes.control} ${
              registerEmailState.isValid === false ? classes.invalid : ""
            }`}
          >
            <label htmlFor="email">Utilisateur</label>
            <input
              type="text"
              id="user"
              value={registerEmailState.value}
              onChange={emailChangeHandler}
              onBlur={validateEmailHandler}
            />
          </div>
          <div
            className={`${classes.control} ${
              passwordState.isValid === false ? classes.invalid : ""
            }`}
          >
            <label htmlFor="password">Mot de Passe</label>
            <input
              type="password"
              id="password"
              value={passwordState.value}
              onChange={passwordChangeHandler}
              onBlur={validatePasswordHandler}
            />
          </div>
          <div className={classes.actions}>
            <Button
              type="submit"
              className={classes.btn}
              disabled={!formIsValid}
            >
              Enregistrement
            </Button>
          </div>
        </form>
      </div>
    </Modal>
  );
};

export default Login;

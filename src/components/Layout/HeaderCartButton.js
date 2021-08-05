import React, {useContext} from "react";

import classes from "./HeaderCartButton.module.css";

import CartContext from "../../store/cart-context";
import CartIcon from "../Cart/CartIcon";

const HeaderCartButton = (props) => {
  
  const cartCtx = useContext(CartContext);
  
  const cartItemNbr = cartCtx.items
  .reduce((currentNbr, item) => {
     return currentNbr + item.amount;
    
  }, 0);
  
  return (
    <button className={classes.button} onClick={props.onClick}>
      <span className={classes.icon}>
        <CartIcon />
      </span>
      <span>Mon Panier</span>
      <span className={classes.badge}>{cartItemNbr}</span>
    </button>
  );
};

export default HeaderCartButton;

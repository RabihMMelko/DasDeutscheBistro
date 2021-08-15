import React, { useContext, useState } from "react";

import classes from "./Cart.module.css";
import Modal from "../UI/Modal";
import CartItem from "./CartItem";
import CartContext from "../../store/cart-context";
import Checkout from "./Checkout";
import axios from "axios";

const Cart = (props) => {
  const [isCheckout, setIsCheckout] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [didSubmit, setDidSubmit] = useState(false);

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

  const commandeHandler = async (userData) => {
    setIsSubmitting(true);
    const orderData = {
      user: userData,
      orderedItems: cartCtx.items,
    };
    
   axios.post("http://localhost:3001/ordersMgmt/addOrder", orderData);
    setIsSubmitting(false);
    setDidSubmit(true);
    cartCtx.clearCart();
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

  const cartModalContent = (
    <React.Fragment>
      {cartItems};
      <div className={classes.total}>
        <span>Prix Total</span>
        <span>{totalAmount}</span>
      </div>
      {isCheckout && (
        <Checkout onConfirm={commandeHandler} onCancel={props.onClose} />
      )}
      {!isCheckout && cartControls}
    </React.Fragment>
  );

  const isSubmittingModalContent = <p>En cours de commande...</p>

  const didSubmitModalContent = 
  <React.Fragment><p>Commande envoyée!</p>
  <div className={classes.actions}>
      <button onClick={props.onClose} className={classes["button"]}>
        Fermer
      </button>
      
    </div></React.Fragment>

  return <Modal onClose={props.onClose}>
    {!isSubmitting && !didSubmit && cartModalContent}
    {isSubmitting && isSubmittingModalContent}
    {!isSubmitting && didSubmit && didSubmitModalContent}
    
    </Modal>;
};
export default Cart;

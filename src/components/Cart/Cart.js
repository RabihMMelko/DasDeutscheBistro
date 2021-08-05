import { useContext } from "react";

import classes from "./Cart.module.css";
import Modal from "../UI/Modal";
import CartItem from "./CartItem";

import CartContext from "../../store/cart-context";

const Cart = (props) => {
const cartCtx = useContext(CartContext);

const totalAmount = `LBP${cartCtx.totalAmount.toFixed(0)}`
const hasItems = cartCtx.items.length > 0;


console.log(cartCtx.items);
const cartItemRemoveHandler = id => {
  cartCtx.removeItem(id)
}  

const cartItemAddHandler = (item) => {
  cartCtx.addItem({...item, amount: 1})
}  

const cartItems = (
  <ul className={classes["cart-items"]}>
      {cartCtx.items.map((item) => (
        <CartItem 
          key = {item.id}
          name = {item.name}
          amount = {item.amount}
          price = {item.price}
          onAdd = {cartItemAddHandler.bind(null, item)}
          onRemove = {cartItemRemoveHandler.bind(null, item.id)}/>
      ))}
    </ul>
  );
  return (
    <Modal onClose={props.onClose}>
      {cartItems}
      <div className={classes.total}>
        <span>Prix Total</span>
        <span>{totalAmount}</span>
      </div>
      <div className={classes.actions}>
        <button onClick={props.onClose} className={classes["button--alt"]}>
          Fermer
        </button>
        { hasItems && <button onClick={props.onClose}className={classes.button}>Commander</button>}
      </div>
    </Modal>
  );
};
export default Cart;

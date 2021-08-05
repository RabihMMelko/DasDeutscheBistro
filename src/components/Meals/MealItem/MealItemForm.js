import { useRef, useState } from "react";

import Input from "../../UI/Input";

import classes from "./MealItemForm.module.css";

const MealItemForm = (props) => {
  const [isValidAmt, setIsValidAmt] = useState(true);
  
  const amountInputRef = useRef()
  
  const submitHandler = event => {
    event.preventDefault();

    const enteredAmount = amountInputRef.current.value;
    const enteredAmtNumber = +enteredAmount;

    if(enteredAmount.trim().length ===0 ||enteredAmtNumber < 1 || enteredAmtNumber > 20){
      setIsValidAmt(false)
      return;
    }

    props.onAddToCart(enteredAmtNumber);
  }
  
  return (
    <form className={classes.form} onSubmit={submitHandler}>
      <Input
        ref = {amountInputRef}
        label="Quantité: "
        input={{
          id: "amount_"+props.id,
          type: "number",
          min: "1",
          max: "20",
          step: "1",
          defaultValue: "1",
        }}
      />
      <button>+ Ajouter</button>
      {!isValidAmt && <p>Veuillez entrer une quantité valide [1-20]</p>}
    </form>
  );
};

export default MealItemForm;

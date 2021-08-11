import { useRef, useState } from "react";

import classes from "./Checkout.module.css";

const isEmpty = (value) => value.trim() === "";

const isTooLong = (value) => value.trim().length !== 4;

const Checkout = (props) => {
  const [formIsValid, setFormIsValid] = useState({
    nom: true,
    addr: true,
    ville: true,
    postalCode: true,
  });
  const nameInputRef = useRef();
  const addressInputRef = useRef();
  const postalInputRef = useRef();
  const cityInputRef = useRef();

  const orderHandler = (event) => {
    event.preventDefault();

    const nom = nameInputRef.current.value;
    const addr = addressInputRef.current.value;
    const zip = postalInputRef.current.value;
    const ville = cityInputRef.current.value;

    const nomValide = !isEmpty(nom);
    const addrValide = !isEmpty(addr);
    const zipValide = !isTooLong(zip);
    const villeValide = !isEmpty(ville);

    setFormIsValid({
      nom: nomValide,
      addr: addrValide,
      ville: villeValide,
      postalCode: zipValide,
    });

    const cmdValide = nomValide && addrValide && villeValide && zipValide;

    if (!cmdValide) {
      return;
    }

    //Commander
  };

  const controlInvNom = `${classes.control} ${
    formIsValid.nom ? "" : classes.invalid
  }`;

  const controlInvAddr = `${classes.control} ${
    formIsValid.addr ? "" : classes.invalid
  }`;
  const controlInvZip = `${classes.control} ${
    formIsValid.postalCode ? "" : classes.invalid
  }`;
  const controlInvVille = `${classes.control} ${
    formIsValid.ville ? "" : classes.invalid
  }`;

  return (
    <form className={classes.form} onSubmit={orderHandler}>
      <div className={controlInvNom}>
        <label htmlFor="name">Votre Nom</label>
        <input type="text" id="name" ref={nameInputRef} />
        {!formIsValid.nom && <p>Veuillez entrer un nom valide</p>}
      </div>
      <div className={controlInvAddr}>
        <label htmlFor="address">Adresse</label>
        <input type="text" id="address" ref={addressInputRef} />
        {!formIsValid.addr && <p>Veuillez entrer une addresse valide</p>}
      </div>
      <div className={controlInvZip}>
        <label htmlFor="postal">Code Postal</label>
        <input type="text" id="postal" ref={postalInputRef} />
        {!formIsValid.postalCode && (
          <p>4 caractères seulement dans le code postal</p>
        )}
      </div>
      <div className={controlInvVille}>
        <label htmlFor="city">Ville</label>
        <input type="text" id="city" ref={cityInputRef} />
        {!formIsValid.ville && <p>Veuillez entrer un nom de ville valide</p>}
      </div>
      <div className={classes.actions}>
        <button type="button" onClick={props.onCancel}>
          Annuler
        </button>
        <button className={classes.submit}>Confirmer</button>
      </div>
    </form>
  );
};

export default Checkout;

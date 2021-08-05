import React from "react";

import mealsImage from "../../assets/meals.jpg";
import classes from "./Header.module.css";
import HeaderCartButton from "./HeaderCartButton";

const Header = (props) => {
  return (
    <React.Fragment>
      <header className={classes.header}>
        <h1>Das Deutsche Bistro</h1>
        <HeaderCartButton onClick={props.onShowCart}>Panier</HeaderCartButton>
      </header>
      <div className={classes["main-img"]}>
        <img src={mealsImage} alt="Buffet Alimentaire" />
      </div>
    </React.Fragment>
  );
};

export default Header;

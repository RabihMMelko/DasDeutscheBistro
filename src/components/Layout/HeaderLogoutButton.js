import React, { useContext, useEffect, useState } from "react";

import classes from "./HeaderCartButton.module.css";

const HeaderLogoutButton = (props) => {
  return (
    <button className={classes.button} onClick={props.onLogout}>
      <span>Déconnexion</span>
    </button>
  );
};

export default HeaderLogoutButton;

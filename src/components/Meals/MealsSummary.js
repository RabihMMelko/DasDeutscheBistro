import React from "react";

import classes from "./MealsSummary.module.css";

const MealsSummary = () => {
  return (
    <section className={classes.summary}>
      <h2>Bon mêts choisis pour vous</h2>
      <p>
        Tous nos mêts sont préparés avec des ingrédients frais et de haute gamme
        par nos chefs experimentés
      </p>
    </section>
  );
};

export default MealsSummary;

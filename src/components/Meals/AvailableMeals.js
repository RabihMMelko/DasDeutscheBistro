import React from "react";

import Card from "../UI/Card";
import MealItem from "./MealItem/MealItem";

import classes from "./AvailableMeals.module.css";

const DUMMY_MEALS = [
  {
    id: "m1",
    name: "Belgische Pommes (Frites Belges)",
    description:
      "Assortiment de Pommes de Terre Idaho, russet et Yukon Gold baignées dans de l'huile de Canola et assaisonnées avec du paprika Hongrois et du sel marin et accompagnées d'une sauce maison",
    price: 34000,
  },
  {
    id: "m2",
    name: "Deustcher Schweineschnitzel (Schnitzel de porc Allemand)",
    description:
      "4 côtelettes de porc assaisonnées avec du poivre noir et du sel marin, baignées dans de l'huile à goût neutre et accompagnées d'une Spaetzle maison",
    price: 69000,
  },
  {
    id: "m3",
    name: "Deutscher Frikadellen (Burger Allemand)",
    description:
      "LA recette traditionnelle du burger: mixture de viande de boeuf et de porc assaisonée avec des oignons, du persil, paprika, sel et poivre noir. Servie dans un Kaiser Roll accompagnées de Belgische Pommes",
    price: 89000,
  },
  {
    id: "m4",
    name: "Ofenkartoffel (Pomme de terre cuite)",
    description:
      "Pomme de Terre cuite sur charbon, assaisonée et personnalisable",
    price: 45000,
  },
];

const AvailableMeals = () => {
  const listeMeals = DUMMY_MEALS.map((meal) => (
    <MealItem
      id={meal.id}
      key={meal.id}
      name={meal.name}
      description={meal.description}
      price={meal.price}
    />
  ));

  return (
    <section className={classes.meals}>
      <Card>
        <ul>{listeMeals}</ul>
      </Card>
    </section>
  );
};

export default AvailableMeals;

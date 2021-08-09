import React, { useState, useEffect } from "react";

import Card from "../UI/Card";
import MealItem from "./MealItem/MealItem";
import axios from "axios"
import classes from "./AvailableMeals.module.css";

// const DUMMY_MEALS = [
//   {
//     id: "m1",
//     name: "Belgische Pommes (Frites Belges)",
//     description:
//       "Assortiment de Pommes de Terre Idaho, russet et Yukon Gold baignées dans de l'huile de Canola et assaisonnées avec du paprika Hongrois et du sel marin et accompagnées d'une sauce maison",
//     price: 34000,
//   },
//   {
//     id: "m2",
//     name: "Deustcher Schweineschnitzel (Schnitzel de porc Allemand)",
//     description:
//       "4 côtelettes de porc assaisonnées avec du poivre noir et du sel marin, baignées dans de l'huile à goût neutre et accompagnées d'une Spaetzle maison",
//     price: 69000,
//   },
//   {
//     id: "m3",
//     name: "Deutscher Frikadellen (Burger Allemand)",
//     description:
//       "LA recette traditionnelle du burger: mixture de viande de boeuf et de porc assaisonée avec des oignons, du persil, paprika, sel et poivre noir. Servie dans un Kaiser Roll accompagnées de Belgische Pommes",
//     price: 89000,
//   },
//   {
//     id: "m4",
//     name: "Ofenkartoffel (Pomme de terre cuite)",
//     description:
//       "Pomme de Terre cuite sur charbon, assaisonée et personnalisable",
//     price: 45000,
//   },
// ];

const DUMMY_MEALS = fetch("http://localhost:3001/listMeals").then((res) => {
  return res.json;
});

console.log(DUMMY_MEALS);

const AvailableMeals = () => {
  const [meals, setMeals] = useState([]);

  

  useEffect(() => {
    
    
    const fetchMeals = async () => {
      const response = await axios.get('http://localhost:3001/listMeals/getAllMeals');
      const responseData = await response;
      const loadedMeals = [];


      for (const key in responseData.data.rows) {
        let item = responseData.data.rows[key]
        loadedMeals.push({
          id: item.meal_id,
          name: item.meal_name,
          description: item.meal_desc,
          price: item.meal_price,
        });
       }

      setMeals(loadedMeals);
    };

    fetchMeals();
  }, []);

  const mealsList = meals.map((meal) => (
    <MealItem
      key={meal.id}
      id={meal.id}
      name={meal.name}
      description={meal.description}
      price={meal.price}
    />
  ));
  
  return (
    <section className={classes.meals} >
      <Card>
        <ul>{mealsList}</ul>
      </Card>
    </section>
  );
};

export default AvailableMeals;

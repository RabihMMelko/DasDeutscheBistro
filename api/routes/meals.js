const express = require('express');
const router = express.Router();

const meals = require('../services/meals')

//get All meals

router.get('/getAllMeals', async function(req, res,next){
    res.header("Access-Control-Allow-Origin", "*"),
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
    try{
      res.json(await meals.getMeals());
  }
  catch(err){
      console.error(err);
      res.status(500).end()
  }
  res.status(200).end()
});

router.post('/getMealsByCateg', async function(req, res,next){
    res.header("Access-Control-Allow-Origin", "*"),
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")

     try{
        res.json(await meals.getCategMeals(req.query.categ));
  }
  catch(err){
      console.error(err);
      res.status(500).end()
  }
  res.status(200).end()
});

router.get('/getAllCategs', async function(req, res,next){
    res.header("Access-Control-Allow-Origin", "*"),
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")

     try{
        res.json(await meals.getAllCategs());
  }
  catch(err){
      console.error(err);
      res.status(500).end()
  }
  res.status(200).end()
});

module.exports = router
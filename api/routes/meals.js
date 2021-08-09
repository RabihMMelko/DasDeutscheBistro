const express = require('express');
const router = express.Router();

const meals = require('../services/meals')

//get All meals

router.get('/getAllMeals', async function(req, res,next){
    res.header("Access-Control-Allow-Origin", "*"),
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
  console.log('starting')  
    try{
      res.json(await meals.getMeals());
      console.log('Done')
  }
  catch(err){
      console.error(err);
  }

});

router.post('/getMealsByCateg', async function(req, res,next){
    res.header("Access-Control-Allow-Origin", "*"),
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")

     try{
        res.json(await meals.getCategMeals(req.query.categ));
  }
  catch(err){
      console.error(err);
  }

});

router.get('/getAllCategs', async function(req, res,next){
    res.header("Access-Control-Allow-Origin", "*"),
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")

     try{
        res.json(await meals.getAllCategs());
  }
  catch(err){
      console.error(err);
  }

});

module.exports = router
const db = require('./db');
const config = require('../config')

const table_name = 'meals';

async function getMeals(){
    const rows = await db.query(
      `SELECT meal_id, meal_name, meal_desc, meal_price, meal_category from `+table_name+` order by meal_category, meal_name`
    );
  
    return {
      rows
    }
  }

  async function getCategMeals(categ){
    
    sql = `SELECT meal_id, meal_name, meal_desc, meal_price from `+table_name+` where upper(meal_category) = upper('`+categ+`') order by meal_category, meal_name`
    const rows = await db.query(
      sql
    );
  
    return {
      rows
    }
  }

  async function getAllCategs(){
    const table_name = 'meals';
    sql = `SELECT meal_category from `+table_name+` group by meal_category`
    const rows = await db.query(
      sql
    );
  
    return {
      rows
    }
  }
  
  module.exports = {
    getMeals,
    getCategMeals,
    getAllCategs
  }
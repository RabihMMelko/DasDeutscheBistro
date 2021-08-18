const mysql = require('mysql2/promise');
const config = require('../config');

async function query(sql, params) {
  const connection = await mysql.createConnection(config.db);
  console.log("Params: ",params)
  const [results, ] =  await connection.execute(sql, params)
  connection.end(function(err){
    console.log("Connection closed.")
  })
  connection.destroy();
  return results;
}

module.exports = {
  query
}
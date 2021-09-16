const express = require("express");
const router = express.Router();

const orders = require("../services/orders");

//create new Order

router.post("/addOrder", async function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*"),
    res.header(
      "Access-Control-Allow-Headers",
      "Origin, X-Requested-With, Content-Type, Accept"
    );
  try {
    await orders.newOrder(req.body)
  } catch (err) {
    console.log(err);
    res.status(500).end()
  }
  res.status(200).end()
});

module.exports = router;

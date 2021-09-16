const express = require("express");
const router = express.Router();

const cart = require("../services/cart");

//Add to Cart

router.post("/addCart", async function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*"),
    res.header(
      "Access-Control-Allow-Headers",
      "Origin, X-Requested-With, Content-Type, Accept"
    );
  try {
    console.log("Req Body", req.body)
    res.json(await cart.addCart())
  } catch (err) {
    console.log(err);
    res.status(500).end()
  }
  res.status(200).end()
});

//Remove from Cart
router.post("/removeCart", async function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*"),
      res.header(
        "Access-Control-Allow-Headers",
        "Origin, X-Requested-With, Content-Type, Accept"
      );
    try {
      console.log("Req Body", req.body)
      res.json(await cart.removeCart())
    } catch (err) {
      console.log(err);
      res.status(500).end()
    }
    res.status(200).end()
  });

//Get Active Cart
router.post("/getCart", async function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*"),
      res.header(
        "Access-Control-Allow-Headers",
        "Origin, X-Requested-With, Content-Type, Accept"
      );
    try {
      console.log("Req Body", req.body)
      res.json(await cart.getActiveCart())
    } catch (err) {
      console.log(err);
      res.status(500).end()
    }
    res.status(200).end()
  });

module.exports = router;

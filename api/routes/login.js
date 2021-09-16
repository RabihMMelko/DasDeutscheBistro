const express = require("express");
const router = express.Router();

const login = require("../services/login");

//login

router.post("/", async function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*"),
    res.header(
      "Access-Control-Allow-Headers",
      "Origin, X-Requested-With, Content-Type, Accept"
    );
  try {
    console.log("Req Body", req.body)
    res.json(await login.login(req.body.userName, req.body.password))
  } catch (err) {
    console.log(err);
    res.status(500).end()
  }
  res.status(200).end()
});

module.exports = router;

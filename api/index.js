const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = process.env.PORT || 3001;
const mealsRouter = require('./routes/meals')
const ordersRouter = require('./routes/orders')
const loginRouter = require('./routes/login')
const cors = require('cors');

app.options('*', cors()) 
app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.get('/', (req, res) => {
  res.json({'message': 'ok'});
});

app.use('/listMeals', mealsRouter);

app.use('/ordersMgmt', ordersRouter);
app.use('/login', loginRouter);

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
});

//Handling errors
app.use((err, req, res, next) => {
    const statusCode = err.statusCode || 500;
    console.error(err.message, err.stack);
    res.status(statusCode).json({'message': err.message});
  
  
    return;
  });
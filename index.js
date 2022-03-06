//importamos los paquetes
const express = require('express');
const bodyParser = require('body-parser');
require('dotenv').config();

//importamos las api routes
const user = require('./routes/user');
const payForm = require('./routes/payForm');
const accReceivable = require('./routes/accReceivable');
const accPay = require('./routes/accPay');
const feesReceivable = require('./routes/feesReceivable');

//crear el servidor
const app = express();

//body-parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

//registrar rutas
app.use('/api', user);
app.use('/api', payForm);
app.use('/api/', accReceivable);
app.use('/api/', accPay);
app.use('/api', feesReceivable);


//asignar un puerto y levantar el servidor
const port = process.env.PORT;
app.listen(port, () => {
    console.log(`El servidor se esta ejecutando en el puerto ${port}`)
});
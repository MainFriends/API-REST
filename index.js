//importamos los paquetes
const express = require('express');
const bodyParser = require('body-parser');
require('dotenv').config();

//importamos las api routes
const user = require('./routes/user');
const login = require('./routes/login');
const payForm = require('./routes/payForm');
const accReceivable = require('./routes/accReceivable');
const accPay = require('./routes/accPay');
const feesReceivable = require('./routes/feesReceivable');
const feesPay = require('./routes/feesPay');
const salesDiscounts = require('./routes/salesDiscounts');
const salesReturns = require('./routes/salesReturns');
const saleInvoice = require('./routes/saleInvoice');
const saleDetail = require('./routes/saleDetail');
const notifications = require('./routes/notifications');

//crear el servidor
const app = express();

//body-parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

//registrar rutas
app.use('/api', user);
app.use('/api', login);
app.use('/api', payForm);
app.use('/api/', accReceivable);
app.use('/api/', accPay);
app.use('/api', feesReceivable);
app.use('/api', feesPay);
app.use('/api', salesDiscounts);
app.use('/api', salesReturns);

app.use('/api', saleInvoice);
app.use('/api', saleDetail);
app.use('/api', notifications);

//asignar un puerto y levantar el servidor
const port = process.env.PORT;
app.listen(port, () => {
    console.log(`El servidor se esta ejecutando en el puerto ${port}`)
});
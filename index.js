const express = require('express');
const router = require('./routes');
const bodyParser = require('body-parser');
require('dotenv').config();

//crear el servidor
const app = express();

//body-parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

//rutas
app.use('/', router());

//asignar un puerto y levantar el servidor
const port = process.env.PORT;
app.listen(port, () => {
    console.log(`El servidor se esta ejecutando en el puerto ${port}`)
});
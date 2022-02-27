//importamos los paquetes
const express = require('express');
const bodyParser = require('body-parser');
require('dotenv').config();

//importamos las api routes
const user = require('./routes/user');

//crear el servidor
const app = express();

//body-parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

//registrar rutas
app.use('/api', user);

//asignar un puerto y levantar el servidor
const port = process.env.PORT;
app.listen(port, () => {
    console.log(`El servidor se esta ejecutando en el puerto ${port}`)
});
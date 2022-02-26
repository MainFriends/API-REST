# :speech_balloon: Indicaciones generales

## :rocket: Instalar las dependencias
Antes de todo, es necesario instalar las dependencias requeridas para el funcionamiento de la API. Para eso ejecutar el comando `npm i`

## :gear: Configurar las variables de entorno
En el archivo .env-example pueden visualizar las variables de entorno que requiere la API. Rellenen cada una de ellas con su respectiva información y al terminar renombren el archivo a .env

## :space_invader: Un controller por cada tabla 
Los controladores son métodos que controlan y manejan la lógica de las solicitudes http. Estas peticiones se harán a los URL o end points de nuestro servidor. Por cada entidad que manejen, necesitan hacer un controller. Ejemplo:  
`controllers/inventoryController.js`  
`controllers/inventoryDetailController.js`  
Recuerden importar el archivo que contiene sus controladores en routes/index.js para poder acceder a sus métodos.

## :spider_web: Manejar las rutas en un mismo lugar 
Manejen todas sus rutas siempre en routes/index.js. Es recomendable que comenten las secciones para llevar un buen orden.

## :thumbsup: Nombrar correctamente las rutas 
Las URL son para identificar las cosas en las que desea operar. Decimos que cada URL identifica un recurso. Estas deben ser nombradas acorde a los [principios REST.](https://code.tutsplus.com/es/tutorials/a-beginners-guide-to-http-and-rest--net-16340)

## :broom: Realicen pruebas en cada endpoint 
Para garantizar el funcionamiento correcto de nuestros controladores, es necesario hacer tests a cada endpoint. Existen herramientas como [Postman](https://www.postman.com/downloads/) o la extensión de visual code [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) que nos ayudan en este aspecto.
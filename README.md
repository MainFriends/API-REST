# :speech_balloon: Indicaciones generales

## :rocket: Instalar las dependencias
Antes de todo, es necesario instalar las dependencias requeridas para el funcionamiento de la API. Para eso ejecutar el comando:  
```bash
npm i
  ```

## :gear: Configurar las variables de entorno
En el archivo `.env-example` pueden visualizar las variables de entorno que requiere la API. Rellenen cada una de ellas con su respectiva información y al terminar renombren el archivo a `.env`.

## :file_folder: Organización de los archivos
Los controladores son métodos que controlan y manejan la lógica de las solicitudes http. Estas peticiones se harán a los URL o endpoints de nuestro servidor. Por cada entidad que manejen, necesitan crear un archivo controller. Ejemplo:  
`controllers/inventoryController.js`  
`controllers/inventoryDetailController.js`  
Recuerden importar estos archivos en sus rutas para poder acceder a los métodos que crearon.

## :white_check_mark: Utilizar códigos de estado.
Las rutas de API REST utilizan un Código de estado HTTP, cada código es un estado que describen múltiples respuestas posibles, es importante que apliques estos códigos de estado para que el usuario final tenga conocimiento sobre el estado de una determinada acción.  
* __200 Ok:__ Este código de respuesta indica que la solicitud GET o DELETE se ha realizado correctamente.  
* __201 Created:__ El recurso ha creado con éxito en respuesta a la petición POST.  
* __304 Not Modified:__ El recurso no ha sido modificado. ejemplo: cuando una petición PUT falla.  
* __400 Bad Request:__ La solicitud fue malformada. Esto sucede especialmente con las solicitudes POST y PUT, cuando los datos no pasan la validación o están en el formato incorrecto.  
* __401 Unauthorized:__ Autenticación fallida.  
* __403 Forbidden:__ El usuario autenticado no tiene permitido acceder a la API final.  
* __404 Not Fount:__ El recurso pedido no existe.  
* __500 Internal Server Error:__ Cuando todo lo demás falla; En general, se utiliza una respuesta 500 cuando el procesamiento falla debido a circunstancias imprevistas en el lado del servidor, lo que provoca el error del servidor.  
> Conoce más códigos de estado en: [HTTP Cats](https://http.cat/)

## :thumbsup: Nombrar correctamente las rutas 
Las URL son para identificar las cosas en las que desea operar. Decimos que cada URL identifica un recurso. Estas deben ser nombradas acorde a lo que establecen los principios REST.
  
__NO HACER__
```
/listarUsuarios
/actualizarUsuarios/11
/eliminarUsuarios/11
/obtenerInventario/4
/eliminarInventario/4
/actualizarInventario/4
```
__SI HACER__
```
/usuarios
/usuarios/11
/inventario
/inventario/4
```
> [Mejores Prácticas de API REST](https://code.tutsplus.com/es/tutorials/a-beginners-guide-to-http-and-rest--net-16340)

## :broom: Realicen pruebas en cada endpoint 
Para garantizar el funcionamiento correcto en la lógica de nuestros controladores, es necesario hacer tests a cada endpoint. Existen herramientas como [Postman](https://www.postman.com/downloads/) o la extensión de visual code [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) que nos ayudan en este aspecto.
# Prueba Siscotel:
## Requerimientos:
Para el desarrollo de este proyecto es:
* Ruby
* Rails
* PostgreSQL
* pgAdmin 4


## Ejercicio 2: Aplicación Web
Se desea implementar una aplicación web responsive que sea capaz de registrar usuarios, así como también listar, detallar, modificar y eliminar usuarios existentes. Para ello, se usará el lenguaje Ruby y el framework Rails. 
 
Los datos que se deben tomar en cuenta para el registro son los siguientes:
* Tipo de persona (Natural o Jurídica)
* Número de documento de identificación (CI, Pasaporte, RIF, etc)
* Fecha de emisión del documento
* Fecha de vencimiento del documento
* Nombre
* Correo electrónico
* Teléfono principal
* Teléfono secundario (campo opcional)   

Los datos deben cumplir una serie de criterios para su validez, además de ser almacenados usando PostgreSQL.

### 1. Creación del Proyecto
* Una vez en la terminal, se accedió a la carpeta deseada y se ejecutó el siguiente comando:`rails new ejercicio_2 --database=postgresql`. Esto crea todas las carpetas asociadas al proyecto y realiza una configuración previa para usar la base de datos requerida. 
* Es necesario completar la configuración en el archivo: [database.yml](https://github.com/Eisler18/prueba_2/blob/master/ejercicio_2/config/database.yml), agregando: host, username y password.
* Posteriormente, se accedió a la nueva carpeta por la terminal y se creó la base de datos en PostgreSQL ejecutando el comando: `rails db:create`.  
* Se crearon el modelo y controlador a usar durante el proyecto con los comandos: `rails generate model User` y `rails generate controller Users`, respectivamente.  
* Se ingresó a través del navegador a la dirección: 'localhost/pgadmin4' para culminar la creación de la base de datos. Para esto, se creó un Server asociado al usuario indicado en la configuración, se abrió un Query Tool y se ejecutó el comando:  
`ALTER TABLE users`   
`ADD COLUMN tipo varchar(10) not null check(tipo = 'Natural' or tipo = 'Juridica'),`   
`ADD COLUMN identificacion int unique not null,` 
`ADD COLUMN emision_id date not null,`  
`ADD COLUMN venc_id date not null,`  
`ADD COLUMN nombre varchar(30) not null,`  
`ADD COLUMN correo varchar(50) not null,`  
`ADD COLUMN tlf_prin var char(15) not null,`  
`ADD COLUMN tlf_sec var char(15);`  
Esto ingresa los campos deseados con las restricciones especificadas. 
* Nuevamente desde la terminal, se ejecutó: `rails db:migrate`, para traer todos los cambios al proyecto.
* Finalmente, se ejecutó el proyecto usando el comando: `rails server`

### 2. Integración de Bootstrap
* Desde una terminal diferente y en la carpeta del proyecto, se instaló Bootstrap: `yarn add bootstrap`, además de jquery y popper,js: `yarn add jquery popper.js`
* Se modificaron los archivos: [application.js](https://github.com/Eisler18/prueba_2/blob/master/ejercicio_2/app/javascript/packs/application.js) y [application.html.erb](https://github.com/Eisler18/prueba_2/blob/master/ejercicio_2/app/views/layouts/application.html.erb) como se muestra.
* Se creó la carpeta 'css' en la carpeta '/app/javascript', la cual contendrá el archivo que será nuestra hoja de estilos: [styles.scss](https://github.com/Eisler18/prueba_2/blob/master/ejercicio_2/app/javascript/css/styles.scss).
* Para poder visualizar los estilos se debe ejecutar el comando: `./bin/webpack-dev-server`, de esta manera se compilaran los cambios realizados en la hoja de estilos.

### 3. Desarrollo del proyecto
* Se modificó el archivo: [routes.rb](https://github.com/Eisler18/prueba_2/blob/master/ejercicio_2/config/routes.rb), para crear todas las rutas de forma automática siguiendo el modelo REST.
* Se ingresaron todos las funciones del controlador necesarias en [users_controller.rb](https://github.com/Eisler18/prueba_2/blob/master/ejercicio_2/app/controllers/users_controller.rb) para el funcionamiento del proyecto.
* Se crearon y editaron todos los archivos pertenecientes a las carpetas: [users](https://github.com/Eisler18/prueba_2/tree/master/ejercicio_2/app/views/users) y [partials](https://github.com/Eisler18/prueba_2/tree/master/ejercicio_2/app/views/partials), así como también el archivo [application.html.erb](https://github.com/Eisler18/prueba_2/blob/master/ejercicio_2/app/views/layouts/application.html.erb), los cuales contienen los códigos HTML de la aplicación.
* Se modificó [user.rb](https://github.com/Eisler18/prueba_2/blob/master/ejercicio_2/app/models/user.rb) agregando las validaciones necesarias para el ingreso de los datos del usuario.
* Por último, se agregaron todos los estilos deseados en [styles.scss](https://github.com/Eisler18/prueba_2/blob/master/ejercicio_2/app/javascript/css/styles.scss).

### 4. Resultados
**Lista de Usuarios**  
![Lista de Usuarios](https://github.com/Eisler18/prueba_2/blob/master/images/users_list.png)

**Nuevo Usuario**  
![Nuevo Usuario](https://github.com/Eisler18/prueba_2/blob/master/images/new_user.png)

**Actualizar Usuario**  
![Actualizar Usuario](https://github.com/Eisler18/prueba_2/blob/master/images/update_user.png)

**Usuario Natural con 1 teléfono**  
![Usuario Natural - 1 Tlf](https://github.com/Eisler18/prueba_2/blob/master/images/show_user_1.png)

**Usuario Jurídico con 2 teléfonos**  
![Usuario Juridico - 2 Tlf](https://github.com/Eisler18/prueba_2/blob/master/images/show_user_2.png)


## Referencias
Para la realización de este proyecto se revisaron diversas fuentes, las más destacadas:
* [Ruby on Rails Guides](https://guides.rubyonrails.org/)
* [Curso completo de introducción a Ruby on Rails](https://www.youtube.com/watch?v=wSNTT8MLI90&t=1549s)
* [Curso de PostgreSQL](https://www.youtube.com/playlist?list=PL8gxzfBmzgex2nuVanqvxoTXTPovVSwi2)
create database MateriaBD;
use MateriaBD;
create table ALUMNOS
(
ID INT IDENTITY (1,1) NOT NULL, /*El identity hace que el campo ID tenga valores que
son agregados directamente por la base de datos sin que el usuario tenga que ingresar
nada y el argumento(1,1) significa que a medida q sumo alumnos el numero id va ir 
aumentando de 1 en uno 1[no hace falta que siempre sea incremental solo hace falta
que no se repita] - Por otro lado el NOT NULL hace que no se acepta el ingreso de 
nulos*/
NOMBRE VARCHAR (50),-- varchar se utiliza para almacenar datos de tipo cadena 
--no Unicode de longitud variable. Lo siguiente ilustra la sintaxix	entre () esta
--la cantidad de caracteres que pueden usar
APELLIDO VARCHAR (50),
DOMICILIO VARCHAR (50),
TELEFONO VARCHAR (20),
);		

/* a todo esto le hace falta una pk(primary key) cuya funcion es la de
 impedir que se repitan las cosas (en este caso los alumnos) a la tabla.
 la pk se la da a un campo de la tabla(en este caso se lo doy a ID entonces es
 la que va a asignar un numero de ID).	*/

 /*en el caso de haber armado una tabla a la cual le falte campos por agregar
 hago lo siguiente*/
ALTER TABLE dbo.ALUMNOS
ADD CONSTRAINT PK_ID PRIMARY KEY (ID);

ALTER TABLE dbo.ALUMNOS
ADD PISO VARCHAR (50);

ALTER TABLE dbo.ALUMNOS
ADD IDPROV TINYINT;
/* EN CASO DE QUERER AGREGAR LA PROV EN QUE NACIERON CADA ALUMNO
  VOY A USAR LOS ID DE LA TABLA PROVINCIAS POR ESO	SON BASE DE DATOS
  RELACIONADAS. USO EL CODIGO DE ID DE LA OTRA TABLA PARA INDICAR EN Q
  PROVINCIA NACIO CADA ALUMNO. PARA QUE NO HAYA ERRORES EN EL CODIGO
  HAY QUE GENERAR UN TIPO DE RESTRICCION  Y ESO ES LA FK QUE CORRESPONDE 
  A UNA FORING KEY, ES UN DATO QUE HACE REFERENCIA A UNA PK DE OTRA
  COLUMNA. ESTO PERMITE QUE NO SE AGREGUE UNA PROVICIA QUE NO EXISTE
  EN MI TABLA DE PROVINCIAS	 Y ADEMAS NO PUEDO ELIMINAR  PROVINCIAS DE MI TABLA DE PROVINCIAS
  SI HAGO REFERENCIA A ELLA EN LA TABLA DE ALUMNOS	 */


CREATE TABLE PROVINCIAS (

ID INT IDENTITY(1,1) NOT NULL,
NOMBRE VARCHAR (30),
PRIMARY KEY (ID),
);

/* ALTER TABLE dbo.ALUMNOS
 ADD CONSTRAINT FK_IDPROV_ID
 FOREIGN KEY (IDPROV)
 REFERENCES	PROVINCIAS (ID)
ESTO LO HIZO MAL EL PROFE ASIQ EN LA OTRA CLASE LO CORRIGE--- LO TENGO QUE VER										 */

 ALTER TABLE dbo.ALUMNOS
 ALTER COLUMN IDPROV INT;
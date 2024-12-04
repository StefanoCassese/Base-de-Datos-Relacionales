alter table dbo.ALUMNOS
drop column IDPROV;		/*Para eliminar una columna*/


 alter table dbo.ALUMNOS
add IDPROV int not null;	

/*creo una restriccion de FK*/
ALTER TABLE dbo.ALUMNOS
add CONSTRAINT	FK_IDPROV_ID
FOREIGN KEY(IDPROV)
REFERENCES PROVINCIAS (ID)

/*RESTRICCION TIPO DEFAULT --->	Si en algun campo no se cargan datos
se le asigna un valor default */

ALTER TABLE dbo.ALUMNOS
add activo tinyint;

ALTER TABLE dbo.ALUMNOS
add CONSTRAINT df_activo --df = defautl --
DEFAULT 1 FOR activo; /*  en definitiva si al campo activo
en este caso yo no le cargo ningun tipo de valro la base de datos
automaticamente le va a asignar un 1.*/

ALTER TABLE dbo.ALUMNOS
add FAlta date; --FAlta = Fecha de alta --

ALTER TABLE dbo.ALUMNOS
add CONSTRAINT df_FAlta--df = defautl --
DEFAULT getutcdate () for FAlta;  /*getutcdate
es una funcion que sirve para que en los campos de tipo
date se le cargue automaticamente el valor de la fehca
de ingreso al sistema*/

/* CHECK   */
ALTER TABLE dbo.ALUMNOS
add CP int;


ALTER TABLE dbo.ALUMNOS
add CONSTRAINT CH_CP--CH = CHECK --
CHECK (CP >= 1000 and CP <= 2000);	 /*---> Sirve para que el sistema
cheque los datos ingresados	cumplan los criterios que le vayamos indicxando */

/*UNIQUE ---> esta restriccion sirve para que no se puedan cargar datos repetidos.*/
ALTER TABLE dbo.ALUMNOS
add CONSTRAINT UN_MAIL unique (mail); --UN = UNIQUE --
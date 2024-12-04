create database Prueba;
use Prueba;
-- ejercicio TAREA2 -- 
create table PROVEEDORES(
ID int identity (1,1) not null,
Razon_Social varchar (50),
Telefono int,
Cuil varchar (15),
Direccion varchar (40),
Mail varchar (40) constraint chek_Mail_formato check(Mail like '%_@__%.__%') not null,
/* el constraint chek_mail_formato check(Mail like '%_@__%.__%') lo usamos de filtro 
para indicar que en el campo mail cuando se ingresen datos estos van a tener que contar 
con un texot seguido de un @ seguido de un texto un punto y mas texto*/
Habilitado tinyint,
Primary Key (ID),
);

-- truncate --> sirve para vaciar toda la info de una tabla --


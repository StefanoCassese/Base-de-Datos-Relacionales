use AdventureWorks2019;
/*FUNCIONES SQL SERVER 
vas a programmability y ahi tenes las funciones-
1 -Table-Valued functions
2 -Scalar-valued functions --> 1 y 2 devuelven = datos 1 valor 2 una tabla
3 -Aggregate Functions ---> las que venimos trabajando	[MAX,MIN,SUM,COUNT,AVG]
3 -System Functions
*/ 

-- Funciones de configuracion <ejemplos>
 select @@SERVERNAME as 'Nombre del Servidor';
 select @@SERVICENAME as 'Nombre del Servidor'; ---> nombre de la instancia del  servidor
 select @@VERSION as 'Version del Servidor';
 select @@LANGUAGE as 'Lenguaje del Servidor';
 select @@LOCK_TIMEOUT as 'Lock TimeOut'; --> es el tiempo en el que una consulta se cierra si es que se queda colgadda.
 -- para cambiar el time out --> Set LOCK_TIMEOUT 'cantidad de tiempo que le quiero dar'
 select @@MAX_CONNECTIONS as 'Cantidad Maxima de Conecciones'; ---> son la cantidad de bases que puede tener en paralelo

 --- DATE TIME FUNCTIONS ---
select DATEDIFF(DAY, '2023-01-01' , '2023-12-31');
select DATEDIFF(MONTH, '2023-01-01' , '2023-12-31');
select DATEDIFF(YEAR, '2023-01-01' , '2023-12-31');
select DATEDIFF(HOUR, '2023-01-01' , '2023-12-31');
select DATEDIFF(MINUTE, '2023-01-01' , '2023-12-31');
select DATEDIFF(SECOND, '2023-01-01' , '2023-12-31');
select DATEADD (DAY, 21, '2023-06-23');
select DAY(GETDATE()); ---> me dice el dia de hoy
select MONTH(GETDATE()); ---> me dice el mes de hoy
select YEAR(GETDATE()); ---> me dice el año de hoy

select DATEDIFF(DAY, '2023-01-01',GETDATE()); ---> le pedi que me diga los dias que pasaron desde el arranque del año hasta hoy

select SYSDATETIME(); ---> me da la hora del sistema

-- Funciones tipo string --
use AdventureWorks2019;
select LOWER(FirstName) from Person.Person;---> MUESTRA EN MINUSUCLA
select UPPER(FirstName) from Person.Person;---> MUESTRA EN MAYUSCULA

select FirstName, LEFT(FirstName,4) from Person.Person;
select FirstName, RIGHT(FirstName,4) from Person.Person; ---> LEFT Y RIGHT ME SIRVE PARA MOSTRAR LA CANTIDAD DE CARACTERES QUE YO DESEO EMPEZANDO DESDE LA DER O LA IZQ

select ltrim ('                 Stefano'); --> sirve para no mostrar los espacios en blanco
select ('           Stefano'); ---> sin ltrim los muestra

select FirstName, REPLACE (FirstName, 'a' , '*') from Person.Person; ---> hago que remplaze el primer caracter por el segundo.
select FirstName, reverse (FirstName) from Person.Person; --> muestra todo al reves
select FirstName +SPACE (10)+ LastName  from Person.Person; ---> agrego espacios de una columna a otra en un mismo campo

Select FirstName, SUBSTRING(FirstName,2,3) from Person.Person; ---> crea un substring a partir del primer caracter(2 en este caso) 


															   --- y de la cantidad de caracteres que selecionams (3 en este caso)

-- Funciones Propias --

 create function DatosxApellido(@apellido varchar (30))
 returns table 
 as
 return
 (
 select * from Person.Person where LastName like '%' + @apellido + '%'
 )
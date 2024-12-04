use AdventureWorks2019;
 
 select SalesOrderID,TotalDue as 'Total', (TotalDue*1.15) as 'Total con Inc' from Sales.SalesOrderHeader;
 /*SalesOrderID,TotalDue as 'Total', (TotalDue*1.15) --> selecciona una columna y le pide que muestre los 
 valores multiplicados por 1.15 y los muestre bajo el nombre de 'Total con Inc' */

 ---------------------------------------------
 
 Select count (*) from Person.Person; -- le estoy diciendo que me diga cuantos campos hay en Person.Person

 Select count (FirstName) as 'Primer Nombre', count (MiddleName) as 'Segundo Nombre', count (LastName) as 'Apellido' from Person.Person;
 /*aca vemos que tanto primer nomb como apellido tienen la misma cantidad de campos sin embargo segundo nom tiene menos y esto es a causa 
 que 1 y apellido no acepta nulls y segundo si*/

 Select * from Sales.SalesPerson;

 Select * from Person.Person where BusinessEntityID=279; 
 -- busoc en la Person.Persona a la persona con BusinessEntityID=279 --

  Select * from Sales.SalesOrderHeader
  inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID;

  /*De esta manera relacionamos el campo de SalesPersonID de la tabla SalesOrderHeader CON el campo BusinessEntityID de la tabla Person */


    Select Person.FirstName as 'Nombre', Person.LastName as 'Apellido', SalesOrderNumber as 'Cantidad de venta' from Sales.SalesOrderHeader
  inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID;
  /*Aca use la relaccion creada en el campo anterior y le pedi que me devuelva los campos que yo necesitaba(nombre,apellido y Cantidad de venta)*/

   Select Person.FirstName as 'Nombre', Person.LastName as 'Apellido', SalesOrderNumber as 'Cantidad de venta' from Sales.SalesOrderHeader
  inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
  where BusinessEntityID=279; -- Aplique todo la anterior pero solo la persona cuyo BusinessEntityID es 279--

  
  Select Person.FirstName as 'Nombre', Person.LastName as 'Apellido', COUNT (SalesOrderNumber) as 'Cantidad de venta' from Sales.SalesOrderHeader
  inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
  where BusinessEntityID=279
  group by Person.FirstName,Person.LastName; /*Con esta consulta agrupada(Group by) SQL recorre la tabla y nos cuenta (COUNT) cuantas veces sale
  el campo solicitado SalesOrderNumber*/

  /*Ejemplo integrando todo*/
    Select Person.FirstName as 'Nombre', Person.LastName as 'Apellido', COUNT (SalesOrderNumber) as 'Cantidad de venta', 
	SUM (TotalDue) as 'Total',
	SUM (TotalDue) * 1.21 as 'Total General',
	MIN (TotalDue) as 'Minimo',
	MAX (TotalDue) as 'Maximo',
	AVG (TotalDue) as 'Promedio'
	from Sales.SalesOrderHeader
  inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
  group by Person.FirstName,Person.LastName;

  ----
     Select Person.FirstName as 'Nombre', Person.LastName as 'Apellido', COUNT (SalesOrderNumber) as 'Cantidad de venta', 
	SUM (TotalDue) as 'Total',
	SUM (TotalDue) * 1.21 as 'Total General',
	MIN (TotalDue) as 'Minimo',
	MAX (TotalDue) as 'Maximo',
	AVG (TotalDue) as 'Promedio'
	from Sales.SalesOrderHeader
  inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
  where BusinessEntityID=279 -- Lo mismo que el anterior pero para 1 sola persona.
  group by Person.FirstName,Person.LastName;


  ---
  Select Person.FirstName as 'Nombre', Person.LastName as 'Apellido', COUNT (SalesOrderNumber) as 'Cantidad de venta', 
	SUM (TotalDue) as 'Total',
	SUM (TotalDue) * 1.21 as 'Total General',
	MIN (TotalDue) as 'Minimo',
	MAX (TotalDue) as 'Maximo',
	AVG (TotalDue) as 'Promedio'
	from Sales.SalesOrderHeader
  inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
  where year (OrderDate) between 2011 and 2012  -- Lo mismo que el anterior pero en el rango de esos 2 años.
  group by Person.FirstName,Person.LastName;

  Select * from Sales.SalesOrderHeader;


  -- Yo quiero saber cuales fueron los empleados que hicieron mas de 20 ventas
  Select Person.FirstName as 'Nombre', Person.LastName as 'Apellido', COUNT (SalesOrderNumber) as 'Cantidad de venta', 
	SUM (TotalDue) as 'Total',
	SUM (TotalDue) * 1.21 as 'Total General',
	MIN (TotalDue) as 'Minimo',
	MAX (TotalDue) as 'Maximo',
	AVG (TotalDue) as 'Promedio'
	from Sales.SalesOrderHeader
  inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
  where year (OrderDate) between 2011 and 2012  -- Lo mismo que el anterior pero en el rango de esos 2 años.
  group by Person.FirstName,Person.LastName
  having COUNT (SalesOrderNumber) > 20; /*HAVING VA SIEMPRE DSP DE GROUP BY y es una clausula que sirve ya q el WHERE no se puede
  colocar sobre un campo calculado--> entonces having vuelve a hacer la cuenta sobere el campo calculado y me devuelve solo aquellos que 
  cumplen con el parametro solicitado.*/

  /*Yo puedo buscar cuanta gente tiene mas ventas que un empleado en particular*/

  select COUNT (SalesOrderNumber) as 'Cantidad de venta'
  from Sales.SalesOrderHeader
  inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
  where SalesOrderHeader.SalesPersonID= 278; /*--> con esto estoy calculando la cantidad de ventas de la persona con SalesPersonID = 278*/
  ----
  Select Person.FirstName as 'Nombre', Person.LastName as 'Apellido', COUNT (SalesOrderNumber) as 'Cantidad de venta', 
	SUM (TotalDue) as 'Total',
	SUM (TotalDue) * 1.21 as 'Total General',
	MIN (TotalDue) as 'Minimo',
	MAX (TotalDue) as 'Maximo',
	AVG (TotalDue) as 'Promedio'
	from Sales.SalesOrderHeader
  inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
  where year (OrderDate) between 2011 and 2012  -- Lo mismo que el anterior pero en el rango de esos 2 años.
  group by Person.FirstName,Person.LastName
  having COUNT (SalesOrderNumber) >
  (select COUNT (SalesOrderNumber) as 'Cantidad de venta'
  from Sales.SalesOrderHeader
  inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
  where SalesOrderHeader.SalesPersonID= 273
  );

  --------------
  /*Funcion TRUNCATE ---> vacia el contenido de una tabla sin hacer modificiaciones en la estructura 
	Funcion BEGIN TRANSACTION ---> Marca el inicion de una transaccion de datos va a estar monitoreada x el motor de base de datos
	por lo que en caso de que esta transaccion tenga un error puedo utilzar el comando ROLLBACK TRANSACTION para deshacer lo efectuado.
	en cambio el COMIT TRANSACTION es para confirmar la misma.  
  */

  ----- EJE. HORAS DE VACACIONES.

  select BusinessEntityID, JobTitle, VacationHours from HumanResources.Employee
  where VacationHours < 50 ;

 -- eso es lo mismo que decir
 Select AVG (VacationHours) from HumanResources.Employee; ---> el promedio de horas d vacaciones es de 50 entonces podemos unificar consultas

 ----
 select BusinessEntityID, JobTitle as 'Puesto', VacationHours as 'Horas de Vacaciones' from HumanResources.Employee
  where VacationHours < (Select AVG (VacationHours) from HumanResources.Employee);


  ---- Seleccionar todos las SalesOrderID y suma de Linetotal de > 30.000
  Select * from Sales.SalesOrderDetail;

  Select SalesOrderID, SUM(LineTotal) as 'Total' 
  From Sales.SalesOrderDetail -- pido que me seleccione Sale SalesOrderID y la SUMA de los LineTotal que estan en la tabla Sales.SalesOrderDetail
  group by SalesOrderID -- con esto voy a agrupar todos los resultados que estoy pidiendo de la SalesOrderID
  having SUM(LineTotal) > 30000 -- y aca esepecifico que me muestro solo aquellas sumas q den mas de 30000
  order by SalesOrderID desc; -- me lo ordena en forma desc.

use AdventureWorks2019;


select * from Person.Person;
select * from HumanResources.Employee;


/*
join entre las tablas persona y empleado, usando como pk BusinessEntityID
*/
select Person.BusinessEntityID,FirstName,LastName,JobTitle from Person.Person
inner join HumanResources.Employee on Employee.BusinessEntityID=Person.BusinessEntityID;


select Person.BusinessEntityID,FirstName,LastName,JobTitle from Person.Person
left join HumanResources.Employee on Employee.BusinessEntityID=Person.BusinessEntityID;

select Person.BusinessEntityID,FirstName,LastName,JobTitle from Person.Person
right join HumanResources.Employee on Employee.BusinessEntityID=Person.BusinessEntityID;



select Person.BusinessEntityID,FirstName,LastName,JobTitle,Gender from Person.Person
left join HumanResources.Employee on Employee.BusinessEntityID=Person.BusinessEntityID;

/*Ejercicio Nro.1*/


select FirstName,LastName,PhoneNumber,EmailAddress from Person.Person
inner join Person.PersonPhone on Person.BusinessEntityID=PersonPhone.BusinessEntityID 
inner join Person.EmailAddress on Person.BusinessEntityID=EmailAddress.BusinessEntityID


Select Person.BusinessEntityID as 'id' ,Person.FirstName as 'Nombre',Person.LastName as 'Apellido',Department.Name as 'Departamento' from HumanResources.Employee 
inner join HumanResources.EmployeeDepartmentHistory on Employee.BusinessEntityID=EmployeeDepartmentHistory.BusinessEntityID
inner join HumanResources.Department on EmployeeDepartmentHistory.DepartmentID=Department.DepartmentID
inner join Person.Person on Employee.BusinessEntityID=Person.BusinessEntityID
where Department.Name in ('Quality Assurance','Production') and EmployeeDepartmentHistory.EndDate is null;


/*Funciones o metodos */

select BusinessEntityID as 'id' ,FirstName as 'Nombre',year(ModifiedDate) as 'Ultima mod.' from Person.Person;


/*
Funciones de agragacion
AVG-->  Promedio
COUNT--> contar 
SUM--> sumar 
MIN --> me devuelve el minimo de una valor
MAX--> me devuelve el maximo de una valor
*/



select * from Sales.SalesOrderHeader order by TotalDue ASC;

select MAX(TotalDue) from Sales.SalesOrderHeader;
select MIN(TotalDue) from Sales.SalesOrderHeader;
select AVG(TotalDue) from Sales.SalesOrderHeader;
select SUM(TotalDue) from Sales.SalesOrderHeader;
select COUNT(TotalDue) from Sales.SalesOrderHeader;


select year(OrderDate) as 'Año',MAX(TotalDue) as 'Venta Maxima' 
from Sales.SalesOrderHeader
group by YEAR(OrderDate)
order by YEAR(OrderDate);


select year(OrderDate) as 'Año',AVG(TotalDue) as 'Promedio' 
from Sales.SalesOrderHeader
group by YEAR(OrderDate)
order by YEAR(OrderDate);

select * from Production.Product





SELECT Color, SUM(ListPrice),Product.Name FROM Production.Product
WHERE Name LIKE '%Mountain%'
GROUP BY Color,Product.Name

--------------------------------------------------------
select SalesOrderID,TotalDue as 'Total',(TotalDue*1.15) as 'Total ' from Sales.SalesOrderHeader;
--------------------------------------------------------


select COUNT(*) from Person.Person;

select COUNT(FirstName) as 'Nombre',COUNT(MiddleName) as 'Segundo Nombre',COUNT(LastName) as 'Apellido' from Person.Person;


------------------------------------------------------------------------------------

select Person.FirstName,Person.LastName,COUNT(SalesOrderNumber) as 'Cantidad',
SUM(TotalDue) As  'total' ,
SUM(TotalDue)*1.21 As  'total General',
min(TotalDue) as 'Minima',
max(TotalDue) as 'Maximo',
avg (TotalDue) as 'promedio'
from Sales.SalesOrderHeader
inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
where year(OrderDate) between 2008 and 2009
group by Person.FirstName,Person.LastName
having COUNT(SalesOrderNumber) < 50;
-------------------------------------------------------------------------------------------


select Person.FirstName,Person.LastName,COUNT(SalesOrderNumber) as 'Cantidad',
SUM(TotalDue) As  'total' ,
SUM(TotalDue)*1.21 As  'total General',
min(TotalDue) as 'Minima',
max(TotalDue) as 'Maximo',
avg (TotalDue) as 'promedio'
from Sales.SalesOrderHeader
inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
where year(OrderDate) between 2008 and 2009
group by Person.FirstName,Person.LastName
having COUNT(SalesOrderNumber) < (select count(SalesOrderNumber) as 'cantidad de ventas'
from Sales.SalesOrderHeader
inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
where SalesOrderHeader.SalesPersonID=278
);

--------------------------------------------------------------------------------------------



select count(SalesOrderNumber) as 'cantidad de ventas'
from Sales.SalesOrderHeader
inner join Person.Person on SalesOrderHeader.SalesPersonID=Person.BusinessEntityID
where SalesOrderHeader.SalesPersonID=278

select * from Sales.SalesOrderHeader;


-------------------------------------------------------------------------------------------


select Person.BusinessEntityID,FirstName,LastName,PersonPhone.PhoneNumber from Person.Person
inner join Person.PersonPhone on PersonPhone.BusinessEntityID=Person.BusinessEntityID
where Person.BusinessEntityID=1;

select Person.BusinessEntityID,FirstName,LastName,PersonPhone.PhoneNumber from Person.Person
inner join Person.PersonPhone on PersonPhone.BusinessEntityID=Person.BusinessEntityID
where Person.BusinessEntityID =(select min(BusinessEntityID) from Person.PersonPhone);


select min(BusinessEntityID) from Person.PersonPhone;


--------------------------------------------------------------------------


select BusinessEntityID,JobTitle,VacationHours from HumanResources.Employee
where VacationHours < (select AVG(VacationHours) from HumanResources.Employee);


select AVG(VacationHours) from HumanResources.Employee;


select * from Sales.SalesOrderDetail;

/*
Seleccionar todos las SalesOrderID y suma de Linetotal que superen los $30.000
*/


select * from Sales.SalesOrderDetail;

select SalesOrderID,SUM(LineTotal) as 'Total'
from Sales.SalesOrderDetail
group by SalesOrderID
having SUM(LineTotal) >30000
order by SalesOrderID desc;


/*
El producto mas vendido
*/

Select * from Production.Product;

Select * from Sales.SalesOrderDetail;

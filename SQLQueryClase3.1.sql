use AdventureWorks2019;
select * from Person.Person;  /* selecciona todos los campos
y registros de la tabla el * hace referencia a todo */

select FirstName,LastName from Person.Person; /* seleciona
los campos requeridos y muestra los registros */

select top(5) * from Person.Person; /* con esto le estoy pidiendo
que me muestre solamente los primeros 5 pueden ser mas o menos */

select top(5) FirstName,LastName from Person.Person;

select *from Person.Person order by FirstName; /* aca le estoy
pidiendo que al mostrame los datos estos esten ordenados por orde en base al primer nombre
(a-z) */ -- esto pq viene de predeterminado con el formato asc de ascendente pero si pongo desc es de (z-a)--

select *from Person.Person order by FirstName desc; -- Se puede combinar con el top y demas --

select top(5) FirstName as 'Nombre', LastName as 'apellido' from Person.Person order by BusinessEntityID; /*Con esto hago
que en la busqueda la columna FirstName pase a llamarse nombre y la columna LastName se llame Apellido*/

select *from Person.Person where BusinessEntityID=4; /* el where sirve
para que pueda buscar un dato especifico en la tabla. En este caso estoy
buscando a la persona que tiene el BusinessEntityID numero 4 */ -- con palabras el = pasa a ser like--
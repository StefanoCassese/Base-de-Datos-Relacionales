use AdventureWorks2019;

/*Operadores = >< BETWEEN NOT ANDO OR Y COMODINES*/

select * from Person.Person where EmailPromotion =1; -- mostra los campos donde EmailPromotion es = a 1;--

select * from Production.Product where ListPrice != 209.025; -- mostra los campos donde ListPrice  es diferente a 209-025--
 --COMODINES--
 select * from Person.Person where FirstName like 'ken'; 
 select * from Person.Person where LastName like 'Sanchez'; -- muestra los campos lastname es sanchez --
 select * from Person.Person where LastName like 'S_nchez'; -- el _[remplaza cualquier letra] sirve como comodin pq sanchez puede estar escrito con ´ o sin entonces de esa manera me aseguro
															-- que busca a todos los sanchez independientemente si escribieron a o á.-
select * from Person.Person where LastName like 'S%'; -- Muestra todos los apellidos que empiecen con S[% = cualquier caracter] - si dsp del % le agrego otra letra estoy
													  -- pidiendo que me muestre los campos que empiezan con s y terminan con otra letra--

select * from Person.Person where LastName like 'S[i,u]%'; -- el[] me sirve para decir que busque los campos que dsp de la s tienen la letra a u o--

select * from Person.Person where LastName like '_[e,u]%';-- Con el _ por delante digo que me busque apellidos cuyas 2 letra es e o u --

-- en estos casos sin % la tabla me devolveria solamente apellidos de 2 letras --

select * from Person.Person where LastName like '_[e,u]A%' -- e busque apellidos cuyas 2 letra es a/e y la tercera deberia ser  a --

-- en estos casos sin % la tabla me devolveria solamente apellidos de 2 letras --


select * from Person.Person where Title is not null; -- campos donde Title es != a NULL [se usa el IS = es not null]--

/*OPERADOR IN = Le puedo dar un conjunto de filtros para que me devuelva resultados */

select * from Person.Person where BusinessEntityID in (1,55,24,11); -- dame los campos en BEID num 1,55,24 y 11--
/* lo puedo usar con string */ select * from Person.Person where LastName in ('Duffy');

/*OPERADOR BETWEEN = Le doy un rango para que me de resultados*/
select * from Person.Person where ModifiedDate BETWEEN '2008-01-01' AND '2009-01-01';
select * from Person.Person where BusinessEntityID BETWEEN 20 AND 30;

/*OPERADORES AND(&&) OR(||)*/

select * from Production.Product where ReorderPoint<500 and ListPrice<=200;

-- Busqueda combinada--

select * from Sales.SalesOrderHeader where OrderDate between '2011-06-07'and '2012-12-30' and TotalDue >500;

Use AdventureWorks2019;
/*Desarrolle un procedimiento almacenado a la base Adventure Works que solicite el
color de un producto y devuelva el
ProductID,ProductNumber,SafetyStockLevel,ReorderPoint.

Tablas de referencia: Product */
CREATE PROCEDURE InfoProducto
    @Color VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT ProductID, ProductNumber, SafetyStockLevel, ReorderPoint
    FROM Production.Product
    WHERE Color = @Color;
END
exec InfoProducto @Color = 'Red';

/*Desarrolle una consulta que devuelva nombre, apellido, puesto, horas de vacaciones de todos aquellos empleados que tengan menos del promedio del total de horas de vacaciones de todos los empleados.
Tablas de referencia: Employee, Person. */

SELECT
    Person.FirstName AS 'Nombre',
    Person.LastName AS 'Apellido',
    HumanResources.Employee.JobTitle AS 'Puesto',
    HumanResources.Employee.VacationHours AS 'Horas de Vacaciones'
FROM
   HumanResources.Employee
    JOIN Person.Person ON Employee.BusinessEntityID = Person.BusinessEntityID
WHERE
    Employee.VacationHours < (
        SELECT AVG(VacationHours)
        FROM HumanResources.Employee
    );



/*Desarrolle un procdimiento almacenado en la base Adventure Works que devuelva el productID, fecha de inicio, fecha fin, costo,  de  todos aquellos productos cuya última modificación fue en 2007 (Este último dato puede varias según su versión de base de datos).

Tablas de referencia: ProductCostHistory */
use AdventureWorks2019;
CREATE PROCEDURE ProdModifi2007
AS
BEGIN
    SELECT
        ProductID, 
        StartDate,
        EndDate,
        StandardCost
    FROM
        Production.ProductCostHistory
    WHERE
        YEAR(ModifiedDate) = 2007;
END;



create database Final;
Use Final;
create table Clientes
(
ID_Clientes int identity(1,1) not null,
Nombre varchar(30) not null,
Apellido varchar(30) not null,
Mail varchar(30) not null,
primary key (ID_Clientes)
);
ALTER TABLE dbo.Clientes
add CONSTRAINT UN_MAIL unique (ID_CLientes);


create table Provincias
(
ID_PROV int identity(1,1) not null,
Provincia varchar(30) not null,
primary key (ID_PROV),
);


create table Pedidos
(
ID_PEDIDO int identity(1,1) not null,
Fecha date,
STOTAL money,
IVA money,
TOTAL money,
primary key (ID_PEDIDO),
);



create table Detalle_Pedidos
(
ID_DETALLE_PEDIDO int identity(1,1) not null,
cant int
primary key (ID_DETALLE_PEDIDO ),
);

create table Producto
(
ID_PRODUCTO int identity(1,1) not null,
DESCRIPCION varchar(30) not null,
primary key (ID_PRODUCTO),
);


create table Categoria
(
ID_CATEGORIA int identity(1,1) not null,
NOMBRE_CATEGORIA varchar(30) not null,
primary key (ID_CATEGORIA),
);


alter table dbo.Clientes
add ID_Prov int not null;
ALTER TABLE dbo.Clientes
add CONSTRAINT	FK_IDProvincia_ID
FOREIGN KEY(ID_PROV)
REFERENCES dbo.Provincias (ID_PROV)



alter table dbo.Pedidos
add ID_Clientes int not null;
ALTER TABLE dbo.Pedidos
add CONSTRAINT	FK_IDClientes_ID
FOREIGN KEY(ID_Clientes)
REFERENCES dbo.Clientes (ID_Clientes)



alter table dbo.Detalle_Pedidos
add ID_Pedido int not null;
ALTER TABLE dbo.Detalle_Pedidos
add CONSTRAINT	FK_IDPedido_ID
FOREIGN KEY(ID_Pedido)
REFERENCES dbo.Pedidos (ID_Pedido)


alter table dbo.Detalle_Pedidos
add ID_Producto int not null;
ALTER TABLE dbo.Detalle_Pedidos
add CONSTRAINT	FK_IDProducto_ID
FOREIGN KEY(ID_Producto)
REFERENCES dbo.Producto (ID_producto)


alter table dbo.Producto
add ID_Categoria int not null;
ALTER TABLE dbo.Producto
add CONSTRAINT	FK_IDCategoria_ID
FOREIGN KEY(ID_Categoria)
REFERENCES dbo.Categoria (ID_Categoria)

INSERT INTO dbo.Provincias VALUES('Buenos Aires')
INSERT INTO dbo.Provincias VALUES('Cordoba')

INSERT INTO dbo.Categoria VALUES('Deporte')
INSERT INTO dbo.Categoria VALUES('Arte')

INSERT INTO dbo.Producto VALUES('Pelota',1,100.00)
INSERT INTO dbo.Producto VALUES('Pincel',2,100.00)

INSERT INTO dbo.Clientes VALUES('Stefano','Cassese','S.c@gmail.com',1)
INSERT INTO dbo.Clientes VALUES('Diego','Camon','D.c@gmail.com',2)

INSERT INTO dbo.Pedidos VALUES(700.00,0.9,550.00,1)
INSERT INTO dbo.Pedidos VALUES(900.00,0.7,550.00,2)

INSERT INTO dbo.Detalle_Pedidos VALUES(3,5,3)
INSERT INTO dbo.Detalle_Pedidos VALUES(3,1,4)









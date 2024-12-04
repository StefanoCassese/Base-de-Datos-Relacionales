create database ZooMundo;
use ZooMundo;
create table ZOO
(
ID_ZOO int identity(1,1) not null,
Nombre_Zoo varchar(30) not null,
Tamaño int not null,
PresupuestoAnual int not null,
primary key (ID_Zoo),
);

create table ANIMAL
(
ID_Animal int identity(1,1) not null,
NombreCientifico varchar(30) not null,
NombreVulgar varchar(30) not null,
PeligroExt tinyint  not null,
FamAnimal varchar(30) not null,
primary key (ID_Animal),
);


create table InfoAnimal
(
ID_Info int identity(1,1) not null,
NumID int identity not null,
AñoNac date not null,
Sexo varchar(25) not null,
Especie varchar  not null,
primary key (ID_Info),
);
ALTER TABLE dbo.InfoAnimal
add CONSTRAINT UN_MAIL unique (NumID); --UN = UNIQUE --

create table CONTINENTE
(
ID_Continente int identity(1,1) not null,
NombreCont varchar(30) not null,
primary key (ID_Continente),
);

create table PAIS
(
ID_Pais int identity(1,1) not null,
NombrePais varchar(30) not null,
primary key (ID_Pais),
);


create table CIUDAD
(
ID_Ciudad int identity(1,1) not null,
NombreCiud varchar(30) not null,
primary key (ID_Ciudad),
);

 alter table dbo.ANIMAL
add IDZOO int not null;	

/*creo una restriccion de FK*/
ALTER TABLE dbo.ANIMAL
add CONSTRAINT	FK_IDZOO_ID
FOREIGN KEY(IDZOO)
REFERENCES ZOO (ID_ZOO)

alter table dbo.ZOO
add IDPAIS int not null;	

/*creo una restriccion de FK*/
ALTER TABLE dbo.ZOO
add CONSTRAINT	FK_IDPAIS_ID
FOREIGN KEY(IDPAIS)
REFERENCES PAIS (ID_Pais)

alter table dbo.ZOO
add IDCIUDAD int not null;	

/*creo una restriccion de FK*/
ALTER TABLE dbo.ZOO
add CONSTRAINT	FK_IDCIUDAD_ID
FOREIGN KEY(IDCIUDAD)
REFERENCES CIUDAD (ID_Ciudad)


alter table dbo.CIUDAD
add IDPAIS int not null;	

/*creo una restriccion de FK*/
ALTER TABLE dbo.CIUDAD
add CONSTRAINT	FK_IDPAISC_ID
FOREIGN KEY(IDPAIS)
REFERENCES PAIS (ID_Pais)

alter table dbo.InfoAnimal
add IDPAIS int not null;	

/*creo una restriccion de FK*/
ALTER TABLE dbo.InfoAnimal
add CONSTRAINT	FK_IDPAISIA_ID
FOREIGN KEY(IDPAIS)
REFERENCES PAIS (ID_Pais)

alter table dbo.InfoAnimal
add IDCONT int not null;	

/*creo una restriccion de FK*/
ALTER TABLE dbo.InfoAnimal
add CONSTRAINT	FK_IDCONT_ID
FOREIGN KEY(IDCONT)
REFERENCES CONTINENTE (ID_Continente)
use master
go
create database CALLCENTER_DB

go
use CALLCENTER_DB
GO
CREATE TABLE PERFILES(
	ID int not null primary key,
	TipoPerfil varchar(20)
)

GO
CREATE TABLE ESTADOS(
	ID int not null primary key,
	EstadoIncidente varchar(20)
)
GO
CREATE TABLE TIPOS(
	ID int not null primary key,
	TipoIncidente varchar(100)
)
GO
CREATE TABLE PRIORIDADES(
	ID int not null primary key,
	PrioridadIncidente varchar(100)
)
GO 
CREATE TABLE PERSONAS(
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Email varchar(150),
	Telefono varchar(50),
	DNI varchar(20)
)
GO
insert into PERFILES values ('1','Administrador'), ('2','Telefonista'), ('3','Supervisor')

GO
insert into ESTADOS values ('1','Abierto'), ('2','En Análisis'), ('3','Cerrado'), ('4','Reabierto'), ('5','Asignado'), ('6','Resuelto')


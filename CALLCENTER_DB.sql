use master
go
create database CALLCENTER_DB

go
use CALLCENTER_DB
GO
CREATE TABLE PERFILES(
	ID int not null primary key identity(1,1),
	TipoPerfil varchar(20)
)

GO
CREATE TABLE ESTADOS(
	ID int not null primary key identity(1,1),
	EstadoIncidente varchar(20)
)
GO
CREATE TABLE TIPOS(
	ID int not null primary key identity(1,1),
	TipoIncidente varchar(100)
)
GO
CREATE TABLE PRIORIDADES(
	ID int not null primary key identity(1,1),
	PrioridadIncidente varchar(100)
)
GO 
CREATE TABLE CLIENTES(
	ID int not null primary key identity(1,1),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Email varchar(150) unique not null,
	Telefono varchar(50),
	DNI varchar(20) unique
)
GO 
CREATE TABLE EMPLEADOS(
	ID int not null primary key identity(1,1),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Email varchar(150) unique not null,
	Telefono varchar(50),
	DNI varchar(20) unique,
	IDPerfil int not null foreign key references PERFILES(ID)
)
GO
CREATE TABLE INCIDENTES(
	Numero int not null primary key identity (1,1),
	Asunto varchar(500),
	Comentario varchar(500),
	Fecha datetime not null,
	IDCliente int not null,
	IDEmpleado int not null,
	IDPrioridad int not null,
	IDTipo int not null,
	IDEstado int not null
)

GO
insert into PERFILES values ('Administrador'), ('Telefonista'), ('Supervisor')

GO
insert into ESTADOS values ('Abierto'), ('En Análisis'), ('Cerrado'), ('Reabierto'), ('Asignado'), ('Resuelto')


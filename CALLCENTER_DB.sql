use master
go
create database CALLCENTER_DB
go
use CALLCENTER_DB

GO
﻿CREATE TABLE USUARIOS(
	Id int not null primary key identity(1,1),
	Usuario varchar(50) not null,
	Pass varchar(50) not null,
	TipoUser int not null
)

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
	TipoIncidente varchar(100) not null
)
GO
CREATE TABLE PRIORIDADES(
	ID int not null primary key identity(1,1),
	PrioridadIncidente varchar(100) not null
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
	IDCliente int not null foreign key references CLIENTES(ID),
	IDEmpleado int not null foreign key references EMPLEADOS(ID),
	IDPrioridad int not null foreign key references PRIORIDADES(ID),
	IDTipo int not null foreign key references TIPOS(ID),
	IDEstado int not null foreign key references ESTADOS(ID)
)
----------------------------------------------------------------
GO
insert into PERFILES values ('Administrador'), ('Telefonista'), ('Supervisor')
GO
insert into ESTADOS values ('Abierto'), ('En Análisis'), ('Cerrado'), ('Reabierto'), ('Asignado'), ('Resuelto')
GO
insert into TIPOS values ('Interno'), ('Externo')
GO
insert into PRIORIDADES values ('Alta'), ('Media'), ('Baja'), ('Urgente')
GO
-------------------
insert into CLIENTES (Nombre, Apellido, Email, Telefono, DNI)
values ('Maxi','Sar Fernandez','maxi@utn.com','1112349876','12345678')
GO
insert into CLIENTES (Nombre, Apellido, Email, Telefono, DNI)
values ('Brian','Lara','brian@utn.com.ar','1573945123','38123456')
GO
insert into CLIENTES (Nombre, Apellido, Email, Telefono, DNI)
values ('Florencia','Gomez','gomez@utn.com.ar','1536985214','25475693')
GO
insert into CLIENTES (Nombre, Apellido, Email, Telefono, DNI)
values ('Lucas','Aguero','lucas@utn.com.ar','1548592314','17859615')
GO
insert into CLIENTES (Nombre, Apellido, Email, Telefono, DNI)
values ('Agustina','Aguilera','agustina@utn.com.ar','1517196245','22703107')
GO
insert into CLIENTES (Nombre, Apellido, Email, Telefono, DNI)
values ('Ailen','Esteves','ailen@utn.com.ar','1596412587','29226865')
GO
insert into CLIENTES (Nombre, Apellido, Email, Telefono, DNI)
values ('Adrian','Aducci','aducci@utn.com.ar','01178963214','33694911')
--------------------
GO
insert into EMPLEADOS (Nombre, Apellido, Email, Telefono, DNI, IDPerfil)
values ('Alejandro','Virasoro','virasoro@call.com.ar','0117852146','29300',1)
GO
insert into EMPLEADOS (Nombre, Apellido, Email, Telefono, DNI, IDPerfil)
values ('Joaquin','Achaval','achaval@call.com.ar','1534715100','14592',2)
GO
insert into EMPLEADOS (Nombre, Apellido, Email, Telefono, DNI, IDPerfil)
values ('Yanina','Cabrera','cabrera@call.com.ar','1559478236','32485',2)
GO
insert into EMPLEADOS (Nombre, Apellido, Email, Telefono, DNI, IDPerfil)
values ('Soledad','Echeverria','echeverria@call.com.ar','1574235914','98745',2)
GO
insert into EMPLEADOS (Nombre, Apellido, Email, Telefono, DNI, IDPerfil)
values ('Lucia','Donatucci','donatucci@call.com.ar','1514287536','42576',2)
GO
insert into EMPLEADOS (Nombre, Apellido, Email, Telefono, DNI, IDPerfil)
values ('Micaela','Giussi','giussi@call.com.ar','1547821597','14295',2)
GO
insert into EMPLEADOS (Nombre, Apellido, Email, Telefono, DNI, IDPerfil)
values ('Alejanda','Cabello','cabella@call.com.ar','1548592631','75236',3)
GO
insert into EMPLEADOS (Nombre, Apellido, Email, Telefono, DNI, IDPerfil)
values ('Estefania','Di Paolo','dipaola@call.com.ar','152589647','95248',1)
----------------------
GO
insert into INCIDENTES (Asunto, Comentario, Fecha, IDCliente, IDEmpleado, IDPrioridad, IDTipo, IDEstado)
values ('El cliente se comunica porque tuvo un error en la factura debido a un mal calculo de la cuota mensual del sistema', 'sin comentario','07/07/21',1,2,2,1,1)
insert into INCIDENTES (Asunto, Comentario, Fecha, IDCliente, IDEmpleado, IDPrioridad, IDTipo, IDEstado)
values ('Llama el cliente porque no puede realizar ventas', 'sin comentario','01/07/21',1,2,2,1,1)
GO
insert into USUARIOS Values ('acabello', 'acabello', 3)
insert into USUARIOS Values ('avirasoro', 'avirasoro', 1)
insert into USUARIOS Values ('edipaolo', 'edipaolo', 1)
insert into USUARIOS Values ('jachaval', 'jachaval', 2)
insert into USUARIOS Values ('ycabrera', 'ycabrera', 2)
insert into USUARIOS Values ('secheverria', 'secheverria', 2)
insert into USUARIOS Values ('ldonatucci', 'ldonatucci', 2)
insert into USUARIOS Values ('mgiussi', 'mgiussi', 2)
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

GO
insert into PERFILES values ('Administrador'), ('Telefonista'), ('Supervisor')

GO
insert into ESTADOS values ('Abierto'), ('En Análisis'), ('Cerrado'), ('Reabierto'), ('Asignado'), ('Resuelto')


------------------------------------------------------------------------------------------
GO
insert into TIPOS values ('Interno'), ('Externo')
GO
insert into PRIORIDADES values ('Alta'), ('Media'), ('Baja'), ('Urgente')
GO
insert into CLIENTES (Nombre, Apellido, Email, Telefono, DNI)
values ('Maxi','Sar Fernandez','maxi@utn.com','1112349876','12345678')
GO
insert into CLIENTES (Nombre, Apellido, Email, Telefono, DNI)
values ('Brian','Lara','brian@utn.com.ar','	','38123456')
GO
insert into EMPLEADOS (Nombre, Apellido, Email, Telefono, DNI, IDPerfil)
values ('Alejandro','Virasoro','virasoro@utn.com.ar','15987654321','29300',1)
GO
insert into EMPLEADOS (Nombre, Apellido, Email, Telefono, DNI, IDPerfil)
values ('Joaquin','Achaval','achaval@utn.com.ar','1534715100','23900',2)
GO
insert into INCIDENTES (Asunto, Comentario, Fecha, IDCliente, IDEmpleado, IDPrioridad, IDTipo, IDEstado)
values ('El cliente se comunica porque tuvo un error en la factura debido a un mal calculo de la cuota mensual del sistema', '','07/07/21',1,2,2,1,1)


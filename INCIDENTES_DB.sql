create database INCIDENTES_DB
go
use INCIDENTES_DB
go

create table INDICENTES(
	Numero bigint not null primary key,
	Empleado bigint not null,
	Cliente varchar(100) not null)
go
insert into INCIDENTES values (100, 207600, 'Juan Perez')
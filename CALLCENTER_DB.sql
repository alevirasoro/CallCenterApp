use master
go
create database CALLCENTER_DB

go
use CALLCENTER_DB
go
USE [CALLCENTER_DB]
GO
 
 CREATE TABLE PERSONAS(
	Nombre varchar(100) not null,
	Apellido varchar(100) not null,
	Email varchar(150) not null,
	Telefono varchar(20) not null
 )

 GO
 create table Empleados(
    Legajo bigint not null primary key,
	Sueldo int null,
	Perfil varchar(50) not null
)


 CREATE TABLE INCIDENTES(
	ID int not null primary key identity(1,1),
	--Cliente 
	EmpleadoLegajo bigint not null foreign key references Empleados(Legajo)
	
 )


-------------------------------------------------

insert into MARCAS values ('Samsung'), ('Apple'), ('Sony'), ('Huawei'), ('Motorola')

insert into CATEGORIAS values ('Celulares'),('Televisores'), ('Media'), ('Audio')


insert into ARTICULOS values ('S01', 'Galaxy S10', 'Una canoa cara', 1, 1, 'https://images.samsung.com/is/image/samsung/co-galaxy-s10-sm-g970-sm-g970fzyjcoo-frontcanaryyellow-thumb-149016542', 69.999),
('M03', 'Moto G Play 7ma Gen', 'Ya siete de estos?', 1, 5, 'https://www.motorola.cl/arquivos/moto-g7-play-img-product.png?v=636862863804700000', 15699),
('S99', 'Play 4', 'Ya no se cuantas versiones hay', 3, 3, 'https://www.euronics.cz/image/product/800x800/532620.jpg', 35000),
('S56', 'Bravia 55', 'Alta tele', 3, 2, 'https://intercompras.com/product_thumb_keepratio_2.php?img=images/product/SONY_KDL-55W950A.jpg&w=650&h=450', 49500),
('A23', 'Apple TV', 'lindo loro', 2, 3, 'https://help.apple.com/assets/5F90CF34680CE2962E2531FF/5F90CF3A680CE2962E253209/es_419/2b072ae7241b199340e6e74728189c2e.png', 7850)




select  A.Codigo CodigoArticulo , Nombre , A.Descripcion Descripcion  , M.Descripcion marca ,C.Descripcion categoria, A.ImagenUrl UrlImagen , A.Precio Precio from ARTICULOS A ,MARCAS M ,CATEGORIAS C WHERE A.IdMarca = M.Id and A.IdCategoria = C.Id







--INNER ENTRE ARTICULOS Y MARCAS


select  A.Codigo CodigoArticulo , Nombre , A.Descripcion Descripcion  , A.ImagenUrl UrlImagen, M.Descripcion Marca from ARTICULOS A ,MARCAS M  WHERE A.IdMarca = M.Id


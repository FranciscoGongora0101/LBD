USE [master]
GO
/****** Object:  Database [PuntodeVenta]    Script Date: 31/5/2020 23:52:47 ******/
CREATE DATABASE [PuntodeVenta]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PuntodeVenta', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PuntodeVenta.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PuntodeVenta_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PuntodeVenta_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PuntodeVenta] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PuntodeVenta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PuntodeVenta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PuntodeVenta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PuntodeVenta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PuntodeVenta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PuntodeVenta] SET ARITHABORT OFF 
GO
ALTER DATABASE [PuntodeVenta] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PuntodeVenta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PuntodeVenta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PuntodeVenta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PuntodeVenta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PuntodeVenta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PuntodeVenta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PuntodeVenta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PuntodeVenta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PuntodeVenta] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PuntodeVenta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PuntodeVenta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PuntodeVenta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PuntodeVenta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PuntodeVenta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PuntodeVenta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PuntodeVenta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PuntodeVenta] SET RECOVERY FULL 
GO
ALTER DATABASE [PuntodeVenta] SET  MULTI_USER 
GO
ALTER DATABASE [PuntodeVenta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PuntodeVenta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PuntodeVenta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PuntodeVenta] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PuntodeVenta] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PuntodeVenta', N'ON'
GO
ALTER DATABASE [PuntodeVenta] SET QUERY_STORE = OFF
GO
USE [PuntodeVenta]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 31/5/2020 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidoPat] [varchar](50) NOT NULL,
	[ApellidoMat] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[idDireccion] [int] NULL,
	[Correo] [varchar](50) NOT NULL,
	[Telefono] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 31/5/2020 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[Id] [int] NOT NULL,
	[Calle] [varchar](40) NOT NULL,
	[NumInt] [int] NOT NULL,
	[NumExt] [int] NOT NULL,
	[CodigoPostal] [int] NOT NULL,
	[Colonia] [varchar](40) NOT NULL,
	[Municipio] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 31/5/2020 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidoPat] [varchar](50) NOT NULL,
	[ApellidoMat] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Telefono] [bigint] NOT NULL,
	[Departamento] [varchar](50) NOT NULL,
	[Sueldo] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 31/5/2020 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Departamento] [varchar](50) NOT NULL,
	[Precio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 31/5/2020 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[Id] [int] NOT NULL,
	[idCliente] [int] NULL,
	[idEmpleado] [int] NULL,
	[idProducto] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[Total] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cliente] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [idDireccion], [Correo], [Telefono]) VALUES (1, N'Martin', N'Gonzalez', N'Rangel', 20, 6, N'sdjasmss@gmail.com', 812193123)
INSERT [dbo].[Cliente] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [idDireccion], [Correo], [Telefono]) VALUES (4, N'Sofia', N'Barrios', N'Luna', 34, 10, N'sofiluna3312@live.com.mx', 81937823)
INSERT [dbo].[Cliente] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [idDireccion], [Correo], [Telefono]) VALUES (11, N'Mario', N'Gomez', N'Tobias', 26, 9, N'mariogt200@live.com.mx', 814958294)
INSERT [dbo].[Cliente] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [idDireccion], [Correo], [Telefono]) VALUES (15, N'Angelica', N'Salas', N'Mata', 40, 2, N'angeliasd2@gmail.com', 81444231)
INSERT [dbo].[Cliente] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [idDireccion], [Correo], [Telefono]) VALUES (22, N'Pedro', N'Gonzalez', N'Dominguez', 23, 1, N'pedro1213@live.com.mx', 81293203)
INSERT [dbo].[Cliente] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [idDireccion], [Correo], [Telefono]) VALUES (23, N'Jose Eduardo', N'De Rio', N'Rangel', 41, 1, N'edudelrio@hotmail.com', 81944932)
INSERT [dbo].[Cliente] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [idDireccion], [Correo], [Telefono]) VALUES (34, N'Silvia', N'Garza', N'Zavala', 19, 5, N'silvia312@live.com.mx', 819238244)
INSERT [dbo].[Cliente] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [idDireccion], [Correo], [Telefono]) VALUES (46, N'Maria', N'Donez', N'Garza', 55, 3, N'maria212@gmail.com', 819203222)
INSERT [dbo].[Cliente] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [idDireccion], [Correo], [Telefono]) VALUES (66, N'Leonardo', N'Garza', N'Ramos', 46, 7, N'leogrza11@live.com.mx', 819775639)
INSERT [dbo].[Cliente] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [idDireccion], [Correo], [Telefono]) VALUES (312, N'Jose', N'Lopez', N'Lopez', 30, 8, N'jlopezl@live.com.mx', 81231222)
INSERT [dbo].[Direccion] ([Id], [Calle], [NumInt], [NumExt], [CodigoPostal], [Colonia], [Municipio]) VALUES (1, N'Gardenia', 300, 220, 66400, N'San Nicolas Centro', N'San Nicolas')
INSERT [dbo].[Direccion] ([Id], [Calle], [NumInt], [NumExt], [CodigoPostal], [Colonia], [Municipio]) VALUES (2, N'Francia', 550, 122, 66321, N'Pedregal de Anahuac', N'San Nicolas')
INSERT [dbo].[Direccion] ([Id], [Calle], [NumInt], [NumExt], [CodigoPostal], [Colonia], [Municipio]) VALUES (3, N'Benito Juarez', 660, 823, 63217, N'Las Puentes', N'San Nicolas')
INSERT [dbo].[Direccion] ([Id], [Calle], [NumInt], [NumExt], [CodigoPostal], [Colonia], [Municipio]) VALUES (5, N'Ocampo', 111, 933, 69238, N'Humberto Lobo', N'San Pedro')
INSERT [dbo].[Direccion] ([Id], [Calle], [NumInt], [NumExt], [CodigoPostal], [Colonia], [Municipio]) VALUES (6, N'Juan Pablo I', 693, 122, 61238, N'Cumbres', N'Monterrey')
INSERT [dbo].[Direccion] ([Id], [Calle], [NumInt], [NumExt], [CodigoPostal], [Colonia], [Municipio]) VALUES (7, N'Sierra', 123, 910, 63292, N'Cumbres', N'Monterrey')
INSERT [dbo].[Direccion] ([Id], [Calle], [NumInt], [NumExt], [CodigoPostal], [Colonia], [Municipio]) VALUES (8, N'Iturbide', 584, 922, 62910, N'Privadas del Sauce', N'Escobedo')
INSERT [dbo].[Direccion] ([Id], [Calle], [NumInt], [NumExt], [CodigoPostal], [Colonia], [Municipio]) VALUES (9, N'Roma', 200, 232, 61923, N'Pedregal del Topo Chico', N'Escobedo')
INSERT [dbo].[Direccion] ([Id], [Calle], [NumInt], [NumExt], [CodigoPostal], [Colonia], [Municipio]) VALUES (10, N'Raul Salinas', 700, 999, 62122, N'Centro de Juarez', N'Juarez')
INSERT [dbo].[Empleado] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [Correo], [Telefono], [Departamento], [Sueldo]) VALUES (23, N'Daniel', N'Flores', N'Flores', 18, N'daaflor12321@gmail.com', 81932042, N'Electronica', 12000)
INSERT [dbo].[Empleado] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [Correo], [Telefono], [Departamento], [Sueldo]) VALUES (45, N'Manuel', N'Juarez', N'Moller', 27, N'manujuarez0101@gmail.com', 819344432, N'Hogar', 11000)
INSERT [dbo].[Empleado] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [Correo], [Telefono], [Departamento], [Sueldo]) VALUES (77, N'Elisa', N'Montemayor', N'Garza', 40, N'elisa888@gmail.com', 819392000, N'Ropa', 13000)
INSERT [dbo].[Empleado] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [Correo], [Telefono], [Departamento], [Sueldo]) VALUES (89, N'Ana', N'Rivera', N'Castro', 55, N'anarivera8193@gmail.com', 819440287, N'Electronica', 6500)
INSERT [dbo].[Empleado] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [Correo], [Telefono], [Departamento], [Sueldo]) VALUES (98, N'Adrian', N'Platas', N'Galvan', 33, N'adrianplatas991@gmail.com', 81934922, N'Limpieza', 14500)
INSERT [dbo].[Empleado] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [Correo], [Telefono], [Departamento], [Sueldo]) VALUES (100, N'Alan', N'Cavazos', N'Gomez', 29, N'alancgas843@gmail.com', 81943555, N'Abarrotes', 8000)
INSERT [dbo].[Empleado] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [Correo], [Telefono], [Departamento], [Sueldo]) VALUES (144, N'Daniela', N'Martinez', N'Sanchez', 60, N'danimtz322@gmail.com', 81119203, N'Papeleria', 7000)
INSERT [dbo].[Empleado] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [Correo], [Telefono], [Departamento], [Sueldo]) VALUES (201, N'Francisco', N'Garza', N'Lopez', 20, N'frangarza1333@gmail.com', 819429300, N'Muebles', 9000)
INSERT [dbo].[Empleado] ([Id], [Nombre], [ApellidoPat], [ApellidoMat], [Edad], [Correo], [Telefono], [Departamento], [Sueldo]) VALUES (233, N'Valeria', N'Barbosa', N'Alcocer', 43, N'valebarbosa@gmail.com', 819334777, N'Farmacia', 18000)
INSERT [dbo].[Producto] ([Id], [Nombre], [Marca], [Departamento], [Precio]) VALUES (11, N'Playera', N'Gucci', N'Ropa', 500)
INSERT [dbo].[Producto] ([Id], [Nombre], [Marca], [Departamento], [Precio]) VALUES (22, N'Paracetamol', N'Farmacias Simil', N'Farmacia', 60)
INSERT [dbo].[Producto] ([Id], [Nombre], [Marca], [Departamento], [Precio]) VALUES (32, N'Tijeras', N'Prit', N'Papeleria', 46)
INSERT [dbo].[Producto] ([Id], [Nombre], [Marca], [Departamento], [Precio]) VALUES (41, N'Jamon Fud', N'Fud', N'Abarrotes', 28)
INSERT [dbo].[Producto] ([Id], [Nombre], [Marca], [Departamento], [Precio]) VALUES (45, N'TV 4K', N'LG', N'Electronica', 10000)
INSERT [dbo].[Producto] ([Id], [Nombre], [Marca], [Departamento], [Precio]) VALUES (72, N'Estante', N'Maderas Robles', N'Muebles', 730)
INSERT [dbo].[Producto] ([Id], [Nombre], [Marca], [Departamento], [Precio]) VALUES (88, N'Coca Cola', N'CocaCola', N'Comida', 20)
INSERT [dbo].[Producto] ([Id], [Nombre], [Marca], [Departamento], [Precio]) VALUES (100, N'Manzana', N'El Dorado', N'Abarrotes', 40)
INSERT [dbo].[Producto] ([Id], [Nombre], [Marca], [Departamento], [Precio]) VALUES (101, N'Ibuprofeno', N'Systemsde', N'Farmacia', 98)
INSERT [dbo].[Venta] ([Id], [idCliente], [idEmpleado], [idProducto], [Cantidad], [Total]) VALUES (3, 34, 98, 32, 1, 46)
INSERT [dbo].[Venta] ([Id], [idCliente], [idEmpleado], [idProducto], [Cantidad], [Total]) VALUES (11, 312, 45, 22, 3, 180)
INSERT [dbo].[Venta] ([Id], [idCliente], [idEmpleado], [idProducto], [Cantidad], [Total]) VALUES (20, 11, 144, 101, 2, 196)
INSERT [dbo].[Venta] ([Id], [idCliente], [idEmpleado], [idProducto], [Cantidad], [Total]) VALUES (40, 312, 45, 11, 2, 1000)
INSERT [dbo].[Venta] ([Id], [idCliente], [idEmpleado], [idProducto], [Cantidad], [Total]) VALUES (100, 22, 100, 22, 1, 60)
INSERT [dbo].[Venta] ([Id], [idCliente], [idEmpleado], [idProducto], [Cantidad], [Total]) VALUES (111, 15, 77, 88, 5, 100)
INSERT [dbo].[Venta] ([Id], [idCliente], [idEmpleado], [idProducto], [Cantidad], [Total]) VALUES (112, 66, 144, 100, 10, 400)
INSERT [dbo].[Venta] ([Id], [idCliente], [idEmpleado], [idProducto], [Cantidad], [Total]) VALUES (134, 34, 98, 32, 2, 92)
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Cliente__60695A19E18E654B]    Script Date: 31/5/2020 23:52:48 ******/
ALTER TABLE [dbo].[Cliente] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Empleado__60695A193D5E1B5D]    Script Date: 31/5/2020 23:52:48 ******/
ALTER TABLE [dbo].[Empleado] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([Id])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
USE [master]
GO
ALTER DATABASE [PuntodeVenta] SET  READ_WRITE 
GO

/*Basicos*/
select c.Nombre, c.Correo, c.Telefono
from Cliente as c
where idDireccion = 5;

select Calle,Colonia, NumInt
from Direccion
where  Municipio = 'Monterrey';

select (e.Nombre + ' ' + e.ApellidoPat + ' ' + e.ApellidoMat) as Nombre_Completo, e.Sueldo  
from Empleado as e
where Departamento = 'Abarrotes';

select c.Edad, c.Nombre, c.Telefono
from Cliente as c
where Edad > 20;

select ve.Total,ve.idCliente as Numero_Cliente, ve.Cantidad
from Venta as ve
where Cantidad > 1;

/*Group by*/
SELECT d.Municipio, COUNT(d.Colonia) as Total
from Direccion as d
group by Municipio

SELECT Departamento, COUNT(Nombre) as Num_Productos
from Producto
group by Departamento

SELECT idEmpleado as Empleado, COUNT(idEmpleado) as Total_Ventas
from Venta 
group by idEmpleado

SELECT e.Departamento, COUNT(e.Nombre) as Empleados
from Empleado as e
group by Departamento

SELECT Edad, COUNT(Id) as Clientes
from Cliente
group by Edad

/*Having*/

SELECT Cantidad, COUNT(Id) as Total_Ventas
from Venta
group by Cantidad
having COUNT(Id) > 2

SELECT ApellidoPat as Apellido_Paterno, COUNT(id) as Total
from Empleado
group by ApellidoPat
having COUNT(ApellidoPat) < 2

SELECT idEmpleado, AVG(Total) as Promedio
from Venta
group by idEmpleado
having AVG(Total) > 100

SELECT Colonia, COUNT(Id) as Total_Direcciones
from Direccion
group by Colonia
having COUNT(Id) > 1

SELECT Departamento, AVG(Precio) as Promedio_Precio
from Producto
group by Departamento
having AVG(Precio) > 50

/*Funciones*/
SELECT MIN(Total) as Minimo_de_Venta
from Venta

SELECT idEmpleado as Empleado, SUM(Total) as Total_Ventas
from Venta
group by idEmpleado

SELECT MAX(Edad) as Edad_Maxima
from Empleado

SELECT AVG(c.Edad) as Edad_Promedio
from Cliente as c

SELECT MIN(Edad) Edad_Minima
from Cliente

/*TOP*/
SELECT TOP 3 * from Cliente

SELECT TOP 5 (e.Nombre + ' ' + e.ApellidoPat + ' ' + e.ApellidoMat) as Nombre_Completo  
from Empleado as e

SELECT TOP 3 Municipio, COUNT(Municipio) as Total
from Direccion
group by Municipio

SELECT TOP 2 Nombre, Marca, Departamento, Precio
from Producto
where Precio > 100

SELECT TOP 7 * from Direccion

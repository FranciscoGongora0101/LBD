USE [master]
GO
/****** Object:  Database [prueba]    Script Date: 28/02/2020 09:37:31 p.m. ******/
CREATE DATABASE [prueba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prueba', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\prueba.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'prueba_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\prueba_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [prueba] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prueba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prueba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prueba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prueba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prueba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prueba] SET ARITHABORT OFF 
GO
ALTER DATABASE [prueba] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [prueba] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [prueba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prueba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prueba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prueba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prueba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prueba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prueba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prueba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prueba] SET  ENABLE_BROKER 
GO
ALTER DATABASE [prueba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prueba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prueba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prueba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prueba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prueba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prueba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prueba] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [prueba] SET  MULTI_USER 
GO
ALTER DATABASE [prueba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prueba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prueba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prueba] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [prueba]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 28/02/2020 09:37:31 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumnos](
	[id] [int] NULL,
	[nombre] [char](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 28/02/2020 09:37:31 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidoPaterno] [varchar](50) NOT NULL,
	[ApellidoMaterno] [varchar](50) NOT NULL,
	[NombreCompleto]  AS (((([Nombre]+'')+[ApellidoPaterno])+'')+[ApellidoMaterno]),
	[Edad] [int] NOT NULL,
	[idDireccion] [uniqueidentifier] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[telefono] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 28/02/2020 09:37:31 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direccion](
	[Id] [uniqueidentifier] NOT NULL,
	[Calle] [varchar](50) NOT NULL,
	[NumInt] [int] NOT NULL,
	[NumExt] [int] NOT NULL,
	[CP] [int] NOT NULL,
	[Colonia] [varchar](50) NOT NULL,
	[Municipio] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 28/02/2020 09:37:31 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Departamento] [varchar](50) NOT NULL,
	[Sueldo] [bigint] NOT NULL,
	[FechaDeNacimiento] [datetime] NOT NULL,
	[Edad]  AS (datediff(year,[FechaDeNacimiento],getdate())),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 28/02/2020 09:37:31 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Precio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 28/02/2020 09:37:31 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [uniqueidentifier] NOT NULL,
	[IdCliente] [uniqueidentifier] NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[Precio] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [index_edad]    Script Date: 28/02/2020 09:37:31 p.m. ******/
CREATE NONCLUSTERED INDEX [index_edad] ON [dbo].[Clientes]
(
	[Edad] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indx_Precio]    Script Date: 28/02/2020 09:37:31 p.m. ******/
CREATE NONCLUSTERED INDEX [indx_Precio] ON [dbo].[Ventas]
(
	[Precio] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [prueba] SET  READ_WRITE 
GO

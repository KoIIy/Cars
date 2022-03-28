USE [master]
GO
/****** Object:  Database [Cars]    Script Date: 29.03.2022 1:17:56 ******/
CREATE DATABASE [Cars]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cars', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Cars.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cars_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Cars_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Cars] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cars].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cars] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cars] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cars] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cars] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cars] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cars] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Cars] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cars] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cars] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cars] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cars] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cars] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cars] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cars] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cars] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Cars] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cars] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cars] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cars] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cars] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cars] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cars] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cars] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cars] SET  MULTI_USER 
GO
ALTER DATABASE [Cars] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cars] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cars] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cars] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cars] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cars] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cars] SET QUERY_STORE = OFF
GO
USE [Cars]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 29.03.2022 1:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adress](
	[AdressID] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](100) NOT NULL,
	[LocalityId] [int] NOT NULL,
	[PostCode] [nvarchar](15) NOT NULL,
	[NumberOfHome] [nvarchar](10) NOT NULL,
	[NumberOfApartment] [nvarchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 29.03.2022 1:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](6) NOT NULL,
	[Region] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
	[InsuranceNumber] [nvarchar](50) NOT NULL,
	[ModelID] [int] NOT NULL,
	[Color] [nvarchar](30) NOT NULL,
	[Year] [nvarchar](4) NOT NULL,
 CONSTRAINT [PK__Car__68A0340ECA7BD08A] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 29.03.2022 1:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locality]    Script Date: 29.03.2022 1:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locality](
	[LocalityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[StateID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocalityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mark]    Script Date: 29.03.2022 1:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mark](
	[MarkID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MarkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model]    Script Date: 29.03.2022 1:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Year] [nvarchar](9) NULL,
	[MarkID] [int] NOT NULL,
 CONSTRAINT [PK__Model__E8D7A1CC78B4B0F9] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 29.03.2022 1:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[OwnerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[AdressID] [int] NOT NULL,
 CONSTRAINT [PK__Owner__81938598A07E1CA5] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 29.03.2022 1:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adress] ON 

INSERT [dbo].[Adress] ([AdressID], [Street], [LocalityId], [PostCode], [NumberOfHome], [NumberOfApartment]) VALUES (1, N'Пушкина', 1, N'112356', N'15', N'2')
INSERT [dbo].[Adress] ([AdressID], [Street], [LocalityId], [PostCode], [NumberOfHome], [NumberOfApartment]) VALUES (2, N'Лермонтова', 4, N'573453', N'0', NULL)
INSERT [dbo].[Adress] ([AdressID], [Street], [LocalityId], [PostCode], [NumberOfHome], [NumberOfApartment]) VALUES (3, N'Гололя', 3, N'125683', N'17', NULL)
INSERT [dbo].[Adress] ([AdressID], [Street], [LocalityId], [PostCode], [NumberOfHome], [NumberOfApartment]) VALUES (4, N'Зелёная', 1, N'516734', N'12', NULL)
INSERT [dbo].[Adress] ([AdressID], [Street], [LocalityId], [PostCode], [NumberOfHome], [NumberOfApartment]) VALUES (5, N'Подгорная', 2, N'270007', N'276', NULL)
SET IDENTITY_INSERT [dbo].[Adress] OFF
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([CarID], [Number], [Region], [OwnerID], [InsuranceNumber], [ModelID], [Color], [Year]) VALUES (2, N'х754ва', 99, 2, N'N97126KK', 1, N'Зелёный', N'2011')
INSERT [dbo].[Car] ([CarID], [Number], [Region], [OwnerID], [InsuranceNumber], [ModelID], [Color], [Year]) VALUES (5, N'К121ТА', 123, 3, N'N12585ST', 3, N'Белый', N'2018')
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (1, N'Россия')
INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (2, N'Польша')
INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (3, N'Гремания')
INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (4, N'США')
INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (5, N'Китай')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Locality] ON 

INSERT [dbo].[Locality] ([LocalityID], [Name], [StateID]) VALUES (1, N'Курганинск', 1)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateID]) VALUES (2, N'Майкоп', 6)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateID]) VALUES (3, N'Краснодар', 1)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateID]) VALUES (4, N'Москва', 2)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateID]) VALUES (5, N'Хабаровск', 3)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateID]) VALUES (6, N'', 1)
SET IDENTITY_INSERT [dbo].[Locality] OFF
GO
SET IDENTITY_INSERT [dbo].[Mark] ON 

INSERT [dbo].[Mark] ([MarkID], [Name]) VALUES (1, N'Lada(ВАЗ)')
INSERT [dbo].[Mark] ([MarkID], [Name]) VALUES (2, N'Mercedes-Benz')
INSERT [dbo].[Mark] ([MarkID], [Name]) VALUES (3, N'BMW')
INSERT [dbo].[Mark] ([MarkID], [Name]) VALUES (4, N'ЗИЛ')
INSERT [dbo].[Mark] ([MarkID], [Name]) VALUES (5, N'ПАЗ')
INSERT [dbo].[Mark] ([MarkID], [Name]) VALUES (6, N'УАЗ')
INSERT [dbo].[Mark] ([MarkID], [Name]) VALUES (7, N'Kia')
SET IDENTITY_INSERT [dbo].[Mark] OFF
GO
SET IDENTITY_INSERT [dbo].[Model] ON 

INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (1, N'2107', N'1982-2012', 1)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (3, N'Granta', N'2018-2022', 1)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (4, N'Granta', N'2011-2018', 1)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (5, N'Hunter', N'2003-2022', 6)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (6, N'Patriot', N'2016-2022', 6)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (7, N'Carnival', N'2014-2021', 7)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (8, N'Ceed GT', N'2015-2018', 7)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (9, N'S Class AMG 55 AMG', N'2002-2005', 2)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (10, N'C-Class 200', N'2006-2011', 2)
SET IDENTITY_INSERT [dbo].[Model] OFF
GO
SET IDENTITY_INSERT [dbo].[Owner] ON 

INSERT [dbo].[Owner] ([OwnerID], [Name], [MiddleName], [LastName], [AdressID]) VALUES (1, N'Сергей', N'Павлович', N'Зыкин', 5)
INSERT [dbo].[Owner] ([OwnerID], [Name], [MiddleName], [LastName], [AdressID]) VALUES (2, N'Илья', N'Николаевич', N'Зелёный', 4)
INSERT [dbo].[Owner] ([OwnerID], [Name], [MiddleName], [LastName], [AdressID]) VALUES (3, N'Пётр', N'Иванович', N'Терёмкин', 1)
INSERT [dbo].[Owner] ([OwnerID], [Name], [MiddleName], [LastName], [AdressID]) VALUES (4, N'Николай', N'Сергеевич', N'Круглов', 2)
INSERT [dbo].[Owner] ([OwnerID], [Name], [MiddleName], [LastName], [AdressID]) VALUES (5, N'Алексей', N'Юрьевич', N'Ерёменко', 3)
SET IDENTITY_INSERT [dbo].[Owner] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateID], [Name], [CountryID]) VALUES (1, N'Краснодарский край', 1)
INSERT [dbo].[State] ([StateID], [Name], [CountryID]) VALUES (2, N'Московская область', 1)
INSERT [dbo].[State] ([StateID], [Name], [CountryID]) VALUES (3, N'Хабаровский край ', 1)
INSERT [dbo].[State] ([StateID], [Name], [CountryID]) VALUES (4, N'Ставропольский край', 1)
INSERT [dbo].[State] ([StateID], [Name], [CountryID]) VALUES (5, N'Камчатский край ', 1)
INSERT [dbo].[State] ([StateID], [Name], [CountryID]) VALUES (6, N'Республика Адыгея', 1)
SET IDENTITY_INSERT [dbo].[State] OFF
GO
ALTER TABLE [dbo].[Adress] ADD  CONSTRAINT [DF_Adress_NumberOfHome]  DEFAULT ((0)) FOR [NumberOfHome]
GO
ALTER TABLE [dbo].[Locality] ADD  CONSTRAINT [DF_Locality_StateID]  DEFAULT ((1)) FOR [StateID]
GO
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_CountryID]  DEFAULT ((1)) FOR [CountryID]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK__Adress__Locality__30F848ED] FOREIGN KEY([LocalityId])
REFERENCES [dbo].[Locality] ([LocalityID])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK__Adress__Locality__30F848ED]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK__Car__ModelID__37A5467C] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Model] ([ModelID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK__Car__ModelID__37A5467C]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK__Car__OwnerID__36B12243] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Owner] ([OwnerID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK__Car__OwnerID__36B12243]
GO
ALTER TABLE [dbo].[Locality]  WITH CHECK ADD  CONSTRAINT [FK_Locality_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Locality] CHECK CONSTRAINT [FK_Locality_State]
GO
ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK__Model__MarkID__267ABA7A] FOREIGN KEY([MarkID])
REFERENCES [dbo].[Mark] ([MarkID])
GO
ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK__Model__MarkID__267ABA7A]
GO
ALTER TABLE [dbo].[Owner]  WITH CHECK ADD  CONSTRAINT [FK__Owner__AdressID__33D4B598] FOREIGN KEY([AdressID])
REFERENCES [dbo].[Adress] ([AdressID])
GO
ALTER TABLE [dbo].[Owner] CHECK CONSTRAINT [FK__Owner__AdressID__33D4B598]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
USE [master]
GO
ALTER DATABASE [Cars] SET  READ_WRITE 
GO

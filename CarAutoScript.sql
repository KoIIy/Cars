USE [Cars]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adress](
	[AdressID] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](100) NOT NULL,
	[NumberOfHome] [nvarchar](10) NOT NULL,
	[NumberOfApartment] [nvarchar](4) NULL,
	[LocalityId] [int] NOT NULL,
	[PostCode] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](6) NULL,
	[Region] [nvarchar](3) NULL,
	[VIN] [nvarchar](17) NOT NULL,
	[InsuranceNumber] [nvarchar](50) NOT NULL,
	[ColorID] [int] NULL,
	[Year] [nvarchar](4) NOT NULL,
	[OwnerID] [int] NOT NULL,
	[ModelID] [int] NOT NULL,
 CONSTRAINT [PK__Car__68A0340EB8A47AE8] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 22.04.2022 20:15:46 ******/
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
/****** Object:  Table [dbo].[Locality]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locality](
	[LocalityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[StateId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocalityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mark]    Script Date: 22.04.2022 20:15:46 ******/
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
/****** Object:  Table [dbo].[Model]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Year] [nvarchar](9) NOT NULL,
	[MarkID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[AdressID] [int] NOT NULL,
	[NumberPhone] [nvarchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](320) NOT NULL,
	[Password] [nvarchar](320) NOT NULL,
	[Email] [nvarchar](320) NOT NULL,
	[RoleID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCACC5A22BBC] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adress] ON 

INSERT [dbo].[Adress] ([AdressID], [Street], [NumberOfHome], [NumberOfApartment], [LocalityId], [PostCode]) VALUES (1, N'Пушкина', N'15', NULL, 1, N'112356')
INSERT [dbo].[Adress] ([AdressID], [Street], [NumberOfHome], [NumberOfApartment], [LocalityId], [PostCode]) VALUES (2, N'Лермонтова', N'1', NULL, 4, N'573453')
INSERT [dbo].[Adress] ([AdressID], [Street], [NumberOfHome], [NumberOfApartment], [LocalityId], [PostCode]) VALUES (3, N'Гололя', N'17', NULL, 3, N'125683')
INSERT [dbo].[Adress] ([AdressID], [Street], [NumberOfHome], [NumberOfApartment], [LocalityId], [PostCode]) VALUES (4, N'Зелёная', N'12', NULL, 1, N'516734')
INSERT [dbo].[Adress] ([AdressID], [Street], [NumberOfHome], [NumberOfApartment], [LocalityId], [PostCode]) VALUES (5, N'Подгорная', N'270', NULL, 2, N'270006')
SET IDENTITY_INSERT [dbo].[Adress] OFF
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([CarID], [Number], [Region], [VIN], [InsuranceNumber], [ColorID], [Year], [OwnerID], [ModelID]) VALUES (1, N'х754ва', N'99', N'JH2PC35051M200020', N'N97126KK', 1, N'2011', 2, 1)
INSERT [dbo].[Car] ([CarID], [Number], [Region], [VIN], [InsuranceNumber], [ColorID], [Year], [OwnerID], [ModelID]) VALUES (2, N'К121ТА', N'123', N'KL1UF756E6B195928', N'N12585ST', 4, N'2018', 3, 3)
INSERT [dbo].[Car] ([CarID], [Number], [Region], [VIN], [InsuranceNumber], [ColorID], [Year], [OwnerID], [ModelID]) VALUES (3, NULL, NULL, N'12345678912', N'12345678912', 2, N'2019', 50, 13)
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([ColorID], [Name]) VALUES (1, N'Чёрный')
INSERT [dbo].[Color] ([ColorID], [Name]) VALUES (2, N'Зелёный')
INSERT [dbo].[Color] ([ColorID], [Name]) VALUES (3, N'Жёлтый')
INSERT [dbo].[Color] ([ColorID], [Name]) VALUES (4, N'Оранжевый')
INSERT [dbo].[Color] ([ColorID], [Name]) VALUES (5, N'Красный')
INSERT [dbo].[Color] ([ColorID], [Name]) VALUES (6, N'Лиловый')
INSERT [dbo].[Color] ([ColorID], [Name]) VALUES (7, N'Белый')
SET IDENTITY_INSERT [dbo].[Color] OFF
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

INSERT [dbo].[Locality] ([LocalityID], [Name], [StateId]) VALUES (1, N'Курганинск', 1)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateId]) VALUES (2, N'Майкоп', 6)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateId]) VALUES (3, N'Краснодар', 1)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateId]) VALUES (4, N'Москва', 2)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateId]) VALUES (5, N'Хабаровск', 3)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateId]) VALUES (6, N'', 1)
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
INSERT [dbo].[Mark] ([MarkID], [Name]) VALUES (8, N'Lamborghini')
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
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (11, N'2106', N'1976-2006', 1)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (12, N'2105', N'1979-2011', 1)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (13, N'Urus', N'2017-2022', 8)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (15, N'X6', N'2014-2020', 3)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (16, N'X5', N'2013-2018', 3)
INSERT [dbo].[Model] ([ModelID], [Name], [Year], [MarkID]) VALUES (17, N'X3', N'2017-2021', 3)
SET IDENTITY_INSERT [dbo].[Model] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonID], [Name], [MiddleName], [LastName], [AdressID], [NumberPhone]) VALUES (1, N'Сергей', N'Павлович', N'Зыкин', 5, N'89889577079')
INSERT [dbo].[Person] ([PersonID], [Name], [MiddleName], [LastName], [AdressID], [NumberPhone]) VALUES (2, N'Илья', N'Николаевич', N'Зелёный', 4, N'89385739459')
INSERT [dbo].[Person] ([PersonID], [Name], [MiddleName], [LastName], [AdressID], [NumberPhone]) VALUES (3, N'Пётр', N'Иванович', N'Терёмкин', 1, N'89159405876')
INSERT [dbo].[Person] ([PersonID], [Name], [MiddleName], [LastName], [AdressID], [NumberPhone]) VALUES (4, N'Николай', N'Сергеевич', N'Круглов', 2, N'79567435970')
INSERT [dbo].[Person] ([PersonID], [Name], [MiddleName], [LastName], [AdressID], [NumberPhone]) VALUES (5, N'Алексей', N'Юрьевич', N'Ерёменко', 3, N'79066834261')
INSERT [dbo].[Person] ([PersonID], [Name], [MiddleName], [LastName], [AdressID], [NumberPhone]) VALUES (50, N'Артём', N'Олегович', N'Мотовилов', 5, N'89181234567')
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'Пользователь')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateID], [Name], [CountryId]) VALUES (1, N'Краснодарский край', 1)
INSERT [dbo].[State] ([StateID], [Name], [CountryId]) VALUES (2, N'Московская область', 1)
INSERT [dbo].[State] ([StateID], [Name], [CountryId]) VALUES (3, N'Хабаровский край ', 1)
INSERT [dbo].[State] ([StateID], [Name], [CountryId]) VALUES (4, N'Ставропольский край', 1)
INSERT [dbo].[State] ([StateID], [Name], [CountryId]) VALUES (5, N'Камчатский край ', 1)
INSERT [dbo].[State] ([StateID], [Name], [CountryId]) VALUES (6, N'Республика Адыгея', 1)
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Login], [Password], [Email], [RoleID], [PersonID]) VALUES (1, N'login', N'password', N'koiiy03@mail.ru', 1, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD FOREIGN KEY([LocalityId])
REFERENCES [dbo].[Locality] ([LocalityID])
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK__Car__ColorID__3E52440B] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Color] ([ColorID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK__Car__ColorID__3E52440B]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK__Car__ModelID__403A8C7D] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Model] ([ModelID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK__Car__ModelID__403A8C7D]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK__Car__OwnerID__3F466844] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK__Car__OwnerID__3F466844]
GO
ALTER TABLE [dbo].[Locality]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Model]  WITH CHECK ADD FOREIGN KEY([MarkID])
REFERENCES [dbo].[Mark] ([MarkID])
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD FOREIGN KEY([AdressID])
REFERENCES [dbo].[Adress] ([AdressID])
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__PersonID__398D8EEE] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__PersonID__398D8EEE]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__RoleID__38996AB5] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__RoleID__38996AB5]
GO
/****** Object:  StoredProcedure [dbo].[AdressAdd]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AdressAdd]
@street NVARCHAR(100),
@numberofhome NVARCHAR(10),
@numberofapartments NVARCHAR(4),
@localitiid INT,
@postcode NVARCHAR(15)
AS
BEGIN
IF NOT EXISTS(
		SELECT A.Street,A.NumberOfHome,A.NumberOfApartment,A.LocalityId,A.PostCode
		FROM Adress AS A
		)
			BEGIN
				INSERT INTO Adress(Street,NumberOfHome,NumberOfApartment,LocalityId,PostCode) VALUES(@street,@numberofhome,@numberofapartments,@localitiid,@postcode)
				RETURN('Added')
			END;
		
		ELSE
			BEGIN
				RETURN('NotAdded')
			END;
END;
GO
/****** Object:  StoredProcedure [dbo].[Authorization]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Authorization]
@login NVARCHAR(320),
@password NVARCHAR(320)
AS
BEGIN
IF EXISTS(SELECT [User].[Login],[User].[Login]
			FROM [User]
			WHERE [User].[Login] = @login AND [User].[Password] = @password)
		BEGIN
			RETURN 'EXIST'
		END;
	ELSE
		BEGIN 
			RETURN 'NOTEXIST' 
		END;
END;
GO
/****** Object:  StoredProcedure [dbo].[CarAdd]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CarAdd]
@number NVARCHAR(6),
@region NVARCHAR(3),
@insurancenumber NVARCHAR(50),
@colorid INT,
@vin NVARCHAR (17),
@year NVARCHAR(4),
@ownerid INT,
@modelid INT
AS
BEGIN
IF NOT EXISTS(
		SELECT Car.Number,Car.Region,Car.InsuranceNumber, Car.ColorID,Car.[Year],Car.OwnerID,Car.ModelID
		FROM Car
		)
			BEGIN
				INSERT INTO Car(Number,Region,InsuranceNumber,ColorID,VIN,[Year],OwnerID,ModelID) VALUES(@number,@region,@insurancenumber,@colorid,@vin,@year,@ownerid,@modelid)
				RETURN('Added')
			END;
		
		ELSE
			BEGIN
				RETURN('NotAdded')
			END;
END;

--ДОБАВЛЕНИЕ ДАННЫХ
GO
/****** Object:  StoredProcedure [dbo].[ColorAdd]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ColorAdd]
@name NVARCHAR(50)
AS
BEGIN
IF NOT EXISTS(
		SELECT Color.[Name]
		FROM Color
		)
			BEGIN
				INSERT INTO Color([Name]) VALUES(@name)
				RETURN('Added')
			END;

		ELSE
			BEGIN
				RETURN('NotAdded')
			END;
END;
GO
/****** Object:  StoredProcedure [dbo].[CountryAdd]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CountryAdd]
@name NVARCHAR(100)
AS
BEGIN
IF NOT EXISTS(
	SELECT Country.[Name]
	FROM Country
	)
		BEGIN
			INSERT INTO Country(Name) VALUES(@name)
			RETURN('Added')
		END;
	ELSE
		BEGIN
			RETURN('NotAdded')
		END;
END;
GO
/****** Object:  StoredProcedure [dbo].[LocalityAdd]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LocalityAdd]
@name NVARCHAR(100),
@stateid INT
AS
BEGIN
IF NOT EXISTS(
		SELECT Locality.[Name],Locality.StateID
		FROM Locality
		)
			BEGIN
				INSERT INTO Locality([Name],StateID) VALUES (@name,@stateid)
				RETURN('Added')
			END;
		ELSE
			BEGIN
				RETURN('NotAdded')
			END;
END;

GO
/****** Object:  StoredProcedure [dbo].[MarkAdd]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MarkAdd]
@name NVARCHAR(30)
AS
BEGIN
	IF NOT EXISTS(	SELECT Mark.[Name]
				FROM Mark)
					BEGIN
						INSERT INTO Mark([Name]) VALUES(@name)
						RETURN('Added')
					END;
				ELSE
					BEGIN
						RETURN('NotAdded')
					END;
END;
GO
/****** Object:  StoredProcedure [dbo].[ModelAdd]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ModelAdd]
@name NVARCHAR(30),
@year NVARCHAR(9),
@markid INT
AS
BEGIN
IF NOT EXISTS(
	SELECT m.[Name],m.[Year],m.MarkID
	FROM Model AS m
	)
		BEGIN
			INSERT INTO Model([Name],[Year],MarkID) VALUES(@name,@year,@markid)
			RETURN('Added')
		END;
	 ELSE
		BEGIN
			RETURN('NotAdded')
		END;
END;
GO
/****** Object:  StoredProcedure [dbo].[PersonAdd]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PersonAdd]
@name NVARCHAR(50),
@midlename NVARCHAR(50),
@lastname NVARCHAR(50),
@adressid INT
AS
BEGIN
IF NOT EXISTS(
		SELECT P.[Name],P.MiddleName,P.LastName,P.AdressID
		FROM [Person] AS P
		)
			BEGIN
				INSERT INTO Person([Name],MiddleName,LastName,AdressID) VALUES(@name,@midlename,@lastname,@adressid)
				RETURN('Added')
			END;
		ELSE
			BEGIN
				RETURN('NotAdded')
			END;
END;
GO
/****** Object:  StoredProcedure [dbo].[StateAdd]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[StateAdd]
@name NVARCHAR(100),
@countryid INT
AS
BEGIN
IF NOT EXISTS(
		SELECT [State].CountryID, [State].[Name]
		FROM [State]
		)
		BEGIN
				INSERT INTO [State]([Name],CountryID) VALUES(@name,@countryid)
				RETURN('Added')
		END;
	ELSE
		BEGIN
			RETURN('NotAdded')
		END;
END;
GO
/****** Object:  StoredProcedure [dbo].[UserAdd]    Script Date: 22.04.2022 20:15:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UserAdd]
@login NVARCHAR(320),
@password NVARCHAR(320),
@email NVARCHAR(320),
@roleid INT,
@personid INT
AS
IF NOT EXISTS(
		SELECT U.[Login],U.[Password],U.Email,U.RoleID,U.PersonID
		FROM [User] AS U
		)
			BEGIN
				INSERT INTO [User]([Login],[Password],Email,RoleID,PersonID) VALUES(@login,@password,@email,@roleid,@personid)
				RETURN('Added')
			END;
		
		ELSE
			BEGIN
				RETURN('NotAdded')
			END;
GO

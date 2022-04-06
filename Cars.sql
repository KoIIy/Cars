CREATE DATABASE [Cars]
GO
USE [Cars]
GO
CREATE TABLE [Mark](
[MarkID] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(30) NOT NULL
);
CREATE TABLE [Model](
[ModelID] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(30) NOT NULL,
[Year] NVARCHAR(9) NOT NULL,
[MarkID] INT FOREIGN KEY REFERENCES[Mark](MarkID) NOT NULL,
);
CREATE TABLE [Country](
[CountryID] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(100) NOT NULL
);
CREATE TABLE[State](
[StateID] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(100) NOT NULL,
[CountryId] INT FOREIGN KEY REFERENCES[Country](CountryId) NOT NULL
);
CREATE TABLE[Locality](
[LocalityID] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(40) NOT NULL,
[StateId] INT FOREIGN KEY REFERENCES[State](StateId) NOT NULL
);

CREATE TABLE[Adress](
[AdressID] INT PRIMARY KEY IDENTITY,
[Street] NVARCHAR(100)  NOT NULL,
[NumberOfHome] NVARCHAR(10)  NOT NULL,
[NumberOfApartment] NVARCHAR(4) ,
[LocalityId] INT FOREIGN KEY REFERENCES[Locality](LocalityId) NOT NULL,
[PostCode] NVARCHAR(15) NOT NULL
);
CREATE TABLE [Person](
[PersonID] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL,
[MiddleName] NVARCHAR(50),
[LastName] NVARCHAR(50) NOT NULL,
[AdressID] INT FOREIGN KEY REFERENCES[Adress](AdressID) NOT NULL,
[NumberPhone]NVARCHAR(11) NOT NULL,
);
CREATE TABLE[Role](
[RoleID] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL
);
GO
CREATE TABLE[User](
[UserID] INT PRIMARY KEY IDENTITY,
[Login] NVARCHAR(320) NOT NULL,
[Password] NVARCHAR(320) NOT NULL,
[Email] NVARCHAR(320) NOT NULL,
[RoleID] INT FOREIGN KEY REFERENCES[Role](RoleID),
[PersonID] INT FOREIGN KEY REFERENCES[Person](PersonID)
);
CREATE TABLE [Color](
[ColorID] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(30) NOT NULL
);
CREATE TABLE [Car](
[CarID] INT PRIMARY KEY IDENTITY,
[Number] NVARCHAR(6) NOT NULL,
[Region] NVARCHAR(3) NOT NULL,
[VIN] NVARCHAR(17) NOT NULL,
[InsuranceNumber] NVARCHAR(50) NOT NULL,
[ColorID] INT FOREIGN KEY REFERENCES[Color](ColorID),
[Year] NVARCHAR(4) NOT NULL,
[OwnerID] INT FOREIGN KEY REFERENCES[Person](PersonID) NOT NULL,
[ModelID] INT FOREIGN KEY REFERENCES[Model](ModelID) NOT NULL
);
GO
CREATE PROC MarkAdd
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
CREATE PROC ModelAdd
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
CREATE PROC CountryAdd
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
CREATE PROC StateAdd
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
CREATE PROC LocalityAdd
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
CREATE PROC AdressAdd
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
CREATE PROC PersonAdd
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
CREATE PROC UserAdd
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
CREATE PROC ColorAdd
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
CREATE PROC CarAdd
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
--Авторизация
CREATE PROC [Authorization]
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
SET IDENTITY_INSERT [dbo].[Country] ON

INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (1, N'Россия')
INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (2, N'Польша')
INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (3, N'Гремания')
INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (4, N'США')
INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (5, N'Китай')

SET IDENTITY_INSERT [dbo].[Country] OFF
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

SET IDENTITY_INSERT [dbo].[Locality] ON 

INSERT [dbo].[Locality] ([LocalityID], [Name], [StateID]) VALUES (1, N'Курганинск', 1)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateID]) VALUES (2, N'Майкоп', 6)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateID]) VALUES (3, N'Краснодар', 1)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateID]) VALUES (4, N'Москва', 2)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateID]) VALUES (5, N'Хабаровск', 3)
INSERT [dbo].[Locality] ([LocalityID], [Name], [StateID]) VALUES (6, N'', 1)

SET IDENTITY_INSERT [dbo].[Locality] OFF
GO
SET IDENTITY_INSERT [dbo].[Adress] ON 

INSERT [dbo].[Adress] ([AdressID], [Street], [LocalityId], [PostCode], [NumberOfHome], [NumberOfApartment]) VALUES (1, N'Пушкина', 1, N'112356', N'15', NULL)
INSERT [dbo].[Adress] ([AdressID], [Street], [LocalityId], [PostCode], [NumberOfHome], [NumberOfApartment]) VALUES (2, N'Лермонтова', 4, N'573453', N'0', NULL)
INSERT [dbo].[Adress] ([AdressID], [Street], [LocalityId], [PostCode], [NumberOfHome], [NumberOfApartment]) VALUES (3, N'Гололя', 3, N'125683', N'17', NULL)
INSERT [dbo].[Adress] ([AdressID], [Street], [LocalityId], [PostCode], [NumberOfHome], [NumberOfApartment]) VALUES (4, N'Зелёная', 1, N'516734', N'12', NULL)
INSERT [dbo].[Adress] ([AdressID], [Street], [LocalityId], [PostCode], [NumberOfHome], [NumberOfApartment]) VALUES (5, N'Подгорная', 2, N'270007', N'276', NULL)

SET IDENTITY_INSERT [dbo].[Adress] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON

INSERT [dbo].[Person] ([PersonID], [Name], [MiddleName], [LastName], [AdressID],NumberPhone) VALUES (1, N'Сергей', N'Павлович', N'Зыкин', 5,'89889577079')
INSERT [dbo].[Person] ([PersonID], [Name], [MiddleName], [LastName], [AdressID],NumberPhone) VALUES (2, N'Илья', N'Николаевич', N'Зелёный', 4,'89385739459')
INSERT [dbo].[Person] ([PersonID], [Name], [MiddleName], [LastName], [AdressID],NumberPhone) VALUES (3, N'Пётр', N'Иванович', N'Терёмкин', 1,'89159405876')
INSERT [dbo].[Person] ([PersonID], [Name], [MiddleName], [LastName], [AdressID],NumberPhone) VALUES (4, N'Николай', N'Сергеевич', N'Круглов', 2,'79567435970')
INSERT [dbo].[Person] ([PersonID], [Name], [MiddleName], [LastName], [AdressID],NumberPhone) VALUES (5, N'Алексей', N'Юрьевич', N'Ерёменко', 3,'79066834261')

SET IDENTITY_INSERT [dbo].[Person] OFF
GO
INSERT [Role]([Name]) VALUES ('Администратор')
INSERT [Role]([Name]) VALUES ('Пользователь')
GO
INSERT [User]([Login],[Password],[Email],RoleID,PersonID) VALUES ('login','password','koiiy03@mail.ru',1,1)
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
INSERT [dbo].[Color]([Name]) VALUES('Чёрный')
INSERT [dbo].[Color]([Name]) VALUES('Зелёный')
INSERT [dbo].[Color]([Name]) VALUES('Жёлтый')
INSERT [dbo].[Color]([Name]) VALUES('Оранжевый')
INSERT [dbo].[Color]([Name]) VALUES('Красный')
INSERT [dbo].[Color]([Name]) VALUES('Лиловый')
INSERT [dbo].[Color]([Name]) VALUES('Белый')
GO

SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([CarID], [Number], [Region], [OwnerID], [InsuranceNumber], [ModelID], [ColorID],[VIN], [Year]) VALUES (1, N'х754ва', N'99', 2, N'N97126KK', 1, 1,'JH2PC35051M200020', N'2011')
INSERT [dbo].[Car] ([CarID], [Number], [Region], [OwnerID], [InsuranceNumber], [ModelID], [ColorID],[VIN], [Year]) VALUES (2, N'К121ТА', N'123', 3, N'N12585ST', 3, 4,'KL1UF756E6B195928', N'2018')

SET IDENTITY_INSERT [dbo].[Car] OFF

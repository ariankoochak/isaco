create database isacoDB
go

use isacoDB
GO
CREATE SCHEMA isaco
GO
CREATE SCHEMA upkco
GO


ALTER DATABASE isacoDB
ADD FILEGROUP isacoDatas;
GO
ALTER DATABASE isacoDB 
ADD FILE 
(
    NAME = isacoDatas,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER22\MSSQL\DATA\isacoDatas.ndf'
)
TO FILEGROUP isacoDatas
GO


ALTER DATABASE isacoDB
ADD FILEGROUP ServicesDatas;
GO
ALTER DATABASE isacoDB 
ADD FILE 
(
    NAME = ServicesDatas,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER22\MSSQL\DATA\ServicesDatas.ndf'
)
TO FILEGROUP ServicesDatas
GO

USE isacoDB

CREATE TABLE isaco.Employee(
    EmployeeId bigint NOT NULL IDENTITY(1, 1),
    UserName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    ServeiceName NVARCHAR(50) NOT NULL,
    UserPassword NVARCHAR(50) NOT NULL,
    PhoneNumber NVARCHAR(50) NOT NULL,
    OrdersIdsDo NVARCHAR(max),
    PRIMARY KEY (EmployeeId)
) ON isacoDatas;


CREATE TABLE isaco.CarsList(
    carId bigint NOT NULL IDENTITY(1, 1),
    CarName NVARCHAR(50) NOT NULL,
    Engine NVARCHAR(50) NOT NULL,
    CarCategory NVARCHAR(50) NOT NULL,
    Colors NVARCHAR(500) NOT NULL,
    PRIMARY KEY (carId)
) ON isacoDatas;


CREATE TABLE isaco.Orders(
    id bigint NOT NULL IDENTITY(1, 1),
    LicensePlate NVARCHAR(9) NOT NULL,
    carId bigint NOT NULL,
	Color NVARCHAR(50) NOT NULL,
    OwnerName NVARCHAR(50) NOT NULL,
	OwnerLastName NVARCHAR(50) NOT NULL,
	OwnerPhoneNumber NVARCHAR(50) NOT NULL,
    ServicesListIds NVARCHAR(500) NOT NULL,
	StartTime DATETIME NOT NULL,
	EndTime DATETIME NOT NULL,
    PRIMARY KEY (id),
	FOREIGN KEY (carId) REFERENCES isaco.CarsList(carId)
) ON ServicesDatas;


CREATE TABLE isaco.Factors(
    factorId bigint NOT NULL IDENTITY(1, 1),
	EmployeeId bigint NOT NULL,
    FactorSubject NVARCHAR(50) NOT NULL,
	FactorBody NVARCHAR(max) NOT NULL,
	TotalPrice NVARCHAR(50) NOT NULL,
    PRIMARY KEY (factorId),
	FOREIGN KEY (EmployeeId) REFERENCES isaco.Employee(EmployeeId),
) ON ServicesDatas;


CREATE TABLE isaco.ServicesList(
    ServiceId bigint NOT NULL IDENTITY(1, 1),
	EmployeeId bigint NOT NULL,
	OrderId bigint NOT NULL,
    ServiceName NVARCHAR(50) NOT NULL,
	serviceExplain NVARCHAR(500) NOT NULL,
    factorId bigint NOT NULL,
	isEnd int NOT NULL,
	isPayed int NOT NULL,
	StartTime DATETIME NOT NULL,
	EndTime DATETIME NOT NULL,
    PRIMARY KEY (ServiceId),
	FOREIGN KEY (EmployeeId) REFERENCES isaco.Employee(EmployeeId),
	FOREIGN KEY (factorId) REFERENCES isaco.Factors(factorId),
) ON ServicesDatas;


INSERT INTO isaco.Employee(
    UserName,
    UserPassword,
    FirstName,
    LastName,
    ServeiceName,
    PhoneNumber)
VALUES (
	'Ali',
	'1234',
    N'علی',
    N'محمدی',
    'autoService',
    '09121234567'
); 

INSERT INTO isaco.Employee(
    UserName,
    UserPassword,
    FirstName,
    LastName,
    ServeiceName,
    PhoneNumber)
VALUES (
	'Reza',
	'1234',
    N'رضا',
    N'جعفری',
    'EngineAndGearbox',
    '09121234568'
); 

INSERT INTO isaco.Employee(
    UserName,
    UserPassword,
    FirstName,
    LastName,
    ServeiceName,
    PhoneNumber)
VALUES (
	'Mojtaba',
	'1234',
    N'مجتبی',
    N'محبی',
    'Fronting',
    '09121234569'
); 

INSERT INTO isaco.Employee(
    UserName,
    UserPassword,
    FirstName,
    LastName,
    ServeiceName,
    PhoneNumber)
VALUES (
	'Nima',
	'1234',
    N'نیما',
    N'کریمی',
    'Detailing',
    '09121234572'
); 

INSERT INTO isaco.Employee(
    UserName,
    UserPassword,
    FirstName,
    LastName,
    ServeiceName,
    PhoneNumber)
VALUES (
	'sa',
	'1234',
    N'ادمین',
    N'ادمینی',
    'Admin',
    '09121234543'
); 

INSERT INTO isaco.Employee(
    UserName,
    UserPassword,
    FirstName,
    LastName,
    ServeiceName,
    PhoneNumber)
VALUES (
	'Morteza',
	'1234',
    N'مرتضی',
    N'اصغری',
    'Others',
    '09121234533'
); 

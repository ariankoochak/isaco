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



INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۲۰۶ تیپ ۲',
	'TU3',
    '206',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۲۰۶ تیپ ۵',
	'TU5',
    '206',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۲۰۶ تیپ ۳',
	'TU3',
    '206',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۲۰۶SD',
	'TU5',
    '206SD',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۲۰۷ تیپ ۲',
	'TU3',
    '207',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۲۰۷ دنده ای',
	'TU5',
    '207',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۲۰۷ اتوماتیک',
	'TU5',
    '207',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
); 


INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۲۰۷ پاناروما دستی',
	'TU5',
    '207',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۲۰۷ پاناروما اتوماتیک',
	'TU5',
    '207',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۲۰۷MC',
	'TU5',
    '207',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۲۰۷SD',
	'TU5',
    '207SD',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۴۰۵',
	'XU7',
    '405',
    'Beige;Black;BluishBlue;MetalicGray;Gray;Red;Silver;White'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'۴۰۵ TU5',
	'TU5',
    '405',
    'Beige;Black;BluishBlue;MetalicGray;Gray;Red;Silver;White'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'2008',
	'Peugeot',
    '2008',
    'MetalicBlack;MetalicGray;MetalicSilver;RoyalBlue;VenetianRed;White;White2Layer'
); 

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'آریسان',
	'XU7P',
    'Arisun',
    'Beige;Black;BluishBlue;MetalicGray;Gray;Charcoal;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'آریسان',
	'XU7',
    'Arisun',
    'Beige;Black;BluishBlue;MetalicGray;Gray;Charcoal;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'دنا معمولی',
	'EF7',
    'Dena',
    'Brown;Black;BluishBlue;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'دنا پلاس ساده',
	'EF7',
    'DenaPlus',
    'Brown;Black;BluishBlue;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'دنا پلاس توربو دستی',
	'EF7 Turbo',
    'DenaPlus',
    'Brown;Black;BluishBlue;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'دنا پلاس توربو 6 دنده',
	'EF7 Turbo',
    'DenaPlus',
    'Brown;Black;BluishBlue;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'دنا پلاس توربو اتوماتیک',
	'EF7 Turbo',
    'DenaPlus',
    'Brown;Black;BluishBlue;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'دنا پلاس جوانان ',
	'EFP',
    'DenaPlus',
    'Brown;Black;BluishBlue;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'H30 Cross',
	'TU5',
    'H30Cross',
    'Brown;Black;Blue;Orange;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'S5 هایما ',
	'Haima',
    'HaimaS5',
    'Brown;Black;Blue;Green;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'S7 هایما ',
	'Haima',
    'HaimaS7',
    'Brown;Black;Blue;Charcoal;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'پارس معمولی',
	'XU7',
    'Pars',
    'BluishBlue;Black;Green;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'پارس ELX',
	'XU7P',
    'Pars',
    'BluishBlue;Black;Green;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'پارس TU5',
	'TU5',
    'Pars',
    'BluishBlue;Black;Green;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'رانا معمولی',
	'TU5',
    'Runna',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'رانا پلاس',
	'TU5',
    'Runna',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'رانا پلاس 6 دنده',
	'TU5',
    'Runna',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'رانا پلاس پاناروما',
	'TU5',
    'Runna',
    'Beige;Black;CaspianBlue;CherryRed;Gray;Red;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'S30',
	'TU5',
    'S30',
    'BluishBlue;Black;Blue;VenetianRed;Gray;Red;Silver;White;Brown'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'سمند معمولی',
	'XU7',
    'SamandLX',
    'Beige;Black;BluishBlue;MetalicGray;Gray;RoyalBlue;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'سمند EF7',
	'EF7',
    'SamandLX',
    'Beige;Black;BluishBlue;MetalicGray;Gray;RoyalBlue;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'سمند TU5',
	'TU5',
    'SamandLX',
    'Beige;Black;BluishBlue;MetalicGray;Gray;RoyalBlue;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'سمندSE',
	'XU7',
    'SamandSE',
    'Beige;Black;BluishBlue;MetalicGray;Gray;RoyalBlue;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'سورن معمولی',
	'XU7',
    'Soren',
    'Beige;Black;BluishBlue;MetalicGray;Gray;RoyalBlue;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'سورن توربو',
	'EF7 Turbo',
    'Soren',
    'Beige;Black;BluishBlue;MetalicGray;Gray;RoyalBlue;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'سورن EF7',
	'EF7',
    'Soren',
    'Beige;Black;BluishBlue;MetalicGray;Gray;RoyalBlue;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'سورن پلاس',
	'EF7',
    'Soren',
    'Beige;Black;BluishBlue;MetalicGray;Gray;RoyalBlue;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'تارا دستی',
	'EF7',
    'Tara',
    'Brown;Black;BluishBlue;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'تارا اتوماتیک',
	'EF7',
    'Tara',
    'Brown;Black;BluishBlue;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'تارا V1',
	'EF7',
    'Tara',
    'Brown;Black;BluishBlue;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'تارا V4',
	'EF7P',
    'Tara',
    'Brown;Black;BluishBlue;RoyalBlue;Gray;VenetianRed;Silver;White'
);

INSERT INTO isaco.CarsList(
    CarName,
    Engine,
    CarCategory,
    Colors)
VALUES (
	N'تارا V3',
	'EF7',
    'Tara',
    'Brown;Black;BluishBlue;RoyalBlue;Gray;VenetianRed;Silver;White'
);

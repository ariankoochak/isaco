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
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\isacoDatas.ndf'
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
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ServicesDatas.ndf'
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
	EndTime DATETIME,
    PRIMARY KEY (id),
	FOREIGN KEY (carId) REFERENCES isaco.CarsList(carId)
) ON ServicesDatas;


CREATE TABLE isaco.Factors(
    factorId bigint NOT NULL IDENTITY(1, 1),
    FactorSubject NVARCHAR(50) NOT NULL,
	FactorBody NVARCHAR(max) NOT NULL,
	TotalPrice NVARCHAR(50) NOT NULL,
    PRIMARY KEY (factorId),
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
	EndTime DATETIME,
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
	N' 2 آریسان',
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
go

create proc AddOrder
(@LicensePlate nvarchar(9),
@carName nvarchar(50),
@Color nvarchar(50),
@OwnerName NVARCHAR(50),
@OwnerLastName NVARCHAR(50),
@OwnerPhoneNumber NVARCHAR(50),
@ServicesListIds NVARCHAR(500))
AS
INSERT INTO isaco.Orders(
    LicensePlate,
    carId,
    Color,
    OwnerName,
    OwnerLastName,
    OwnerPhoneNumber,
	ServicesListIds,
	StartTime
	)
VALUES (
	@LicensePlate,
	(select carId from isaco.CarsList where CarName = @carName),
    @Color,
    @OwnerName,
	@OwnerLastName,
    @OwnerPhoneNumber,
	@ServicesListIds,
	getdate()
); 

go

create proc AddFinishOrderTime
@OrderId bigint
as
UPDATE isaco.Orders
SET EndTime = getdate()
WHERE id = @OrderId;

go

create proc AddServices
(@EmployeeId bigint,
@OrderId bigint,
@ServiceName NVARCHAR(50),
@serviceExplain NVARCHAR(500),
@factorId bigint)
AS
INSERT INTO isaco.ServicesList(
    EmployeeId,
    OrderId,
    ServiceName,
    serviceExplain,
    factorId,
    isEnd,
	isPayed,
	StartTime
	)
VALUES (
	@EmployeeId,
	@OrderId,
    @ServiceName,
    @serviceExplain,
	@factorId,
    0,
	0,
	getdate()
); 

go

create proc AddFinishServiceTime
@ServiceId bigint
as
UPDATE isaco.ServicesList
SET EndTime = getdate(),isEnd = 1
WHERE ServiceId = @ServiceId;

go

create proc AddPayedService
@ServiceId bigint
as
UPDATE isaco.ServicesList
SET isPayed = 1
WHERE ServiceId = @ServiceId;

go

create proc AddFactor
(
@FactorSubject NVARCHAR(50),
@FactorBody NVARCHAR(max),
@TotalPrice NVARCHAR(50)
)
AS
INSERT INTO isaco.Factors(
    FactorSubject,
    FactorBody,
    TotalPrice
)
VALUES (
	@FactorSubject,
    @FactorBody,
    @TotalPrice
); 

go
create function FindOrderById (@id bigint)
returns table
as
return(
select * from isaco.Orders where id = @id
)

go

create function FindOrdersByPlate (@LicensePlate nvarchar(9))
returns table
as
return(
select * from isaco.Orders where LicensePlate = @LicensePlate
)

go

create function GetOwnerDataByOrderId (@id bigint)
returns table
as
return(
select OwnerName,OwnerLastName,OwnerPhoneNumber from isaco.Orders where id = @id
)

go

create function GetCarDataByOrderId (@id bigint)
returns table
as
return(
select * from isaco.CarsList where carId = (select carId from isaco.Orders where id = @id)
)
go

create function FindServiceById(@id bigint)
returns table
as
return(
select * from isaco.ServicesList where ServiceId = @id
)

go

create function GetEmployeeByServiceId (@id bigint)
returns table
as
return(
select * from isaco.Employee where EmployeeId = (select EmployeeId from isaco.ServicesList where ServiceId = @id)
)
go

create function GetAllServicesByServiceName (@ServiceName nvarchar(50))
returns table
as
return(
select * from isaco.ServicesList where ServiceName = @ServiceName
)

go

create function GetNotFinishedServicesByServiceName (@ServiceName nvarchar(50))
returns table
as
return(
select * from isaco.ServicesList where ServiceName = @ServiceName and isEnd = 0
)

go

create function GetFinishedServicesByServiceName (@ServiceName nvarchar(50))
returns table
as
return(
select * from isaco.ServicesList where ServiceName = @ServiceName and isEnd = 1
)


go

create function GeServicesByOrderId (@OrderId bigint)
returns table
as
return(
select * from isaco.ServicesList where OrderId = @OrderId
)

go

create function GetServicesByServiceIdWithFactors(@ServiceId bigint)
returns table
as
return(
select ServiceId,EmployeeId,OrderId,ServiceName,serviceExplain,isEnd,isPayed,StartTime,EndTime,FactorSubject,FactorBody,TotalPrice from isaco.ServicesList inner join isaco.factors on factors.factorId = ServicesList.factorId where ServiceId = @ServiceId
)

go

create function GetCarsListByCarCategory(@carCat nvarchar(50))
returns table
as
return(
select * from isaco.CarsList where CarCategory = @carCat
)

go

create function LoginCheck(@username nvarchar(50),@password nvarchar(50))
returns table
as
return(
select * from isaco.Employee where UserName = @username and UserPassword = @password
)
go
create function getCarsNameByCarCategory(@carCategory nvarchar(50))
returns table
as
return(
select CarName from isaco.CarsList where CarCategory = @carCategory
)
go

create function getCarColorsByCarCategory(@carCategory nvarchar(50))
returns table
as
return(
select DISTINCT Colors from isaco.CarsList where CarCategory = @carCategory
)
go

create view carsType
as
select DISTINCT  CarCategory from isaco.CarsList

go

create view ordersList
as
select id,LicensePlate,Color,OwnerName,OwnerLastName,OwnerPhoneNumber,ServicesListIds,FORMAT(StartTime,'yyyy/MM/dd','fa') as 'StartTime',EndTime,CarName,Engine,CarCategory,Colors from isaco.Orders inner join isaco.CarsList on CarsList.carId = Orders.carId
--exec AddOrder '91NN68622',2,'Gray',N'آرین',N'کوچک','09128693860','1;2;3'
--exec AddFactor 'AutoService',N' فیلتر هوا :600000;فیلتر روغن :200000','800000'
--exec AddServices 1,1,'autoService',N'سرویس دوره ای انجام شود',3
--exec AddFinishOrderTime 1
--exec AddFinishServiceTime 1
--exec AddPayedService 1
go
create function getOrdersByService(@serviceName nvarchar(50))
returns table
as
return(
select id,LicensePlate,Color,OwnerName,OwnerLastName,OwnerPhoneNumber,ServicesListIds,FORMAT(StartTime,'yyyy/MM/dd','fa') as 'StartTime',EndTime,CarName,Engine,CarCategory,Colors from isaco.Orders inner join isaco.CarsList on CarsList.carId = Orders.carId where ServicesListIds like '%' + @serviceName + '%'
)

go

create view employeeList
as
select * from isaco.Employee
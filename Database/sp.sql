use isacoDB
go
create proc AddOrder
(@LicensePlate nvarchar(9),
@carId bigint,
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
	@carId,
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





--exec AddOrder '91NN68622',2,'Gray',N'آرین',N'کوچک','09128693860','1;2;3'
--exec AddFactor 1,'AutoService',N' فیلتر هوا :600000;فیلتر روغن :200000','800000'
--exec AddServices 1,1,'autoService',N'سرویس دوره ای انجام شود',1
--exec AddFinishOrderTime 1
--exec AddFinishServiceTime 1
--exec AddPayedService 1


use isacoDB
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

create function GetNotFinishedServicesByServiceNameWithOrder (@ServiceName nvarchar(50))
returns table
as
return(
select * from isaco.ServicesList where ServiceName = @ServiceName and isEnd = 0 order by(StartTime) desc
)

go

create function GetFinishedServicesByServiceName (@ServiceName nvarchar(50))
returns table
as
return(
select * from isaco.ServicesList where ServiceName = @ServiceName and isEnd = 1
)

go

create function GetFinishedServicesByServiceNameWithOrder (@ServiceName nvarchar(50))
returns table
as
return(
select * from isaco.ServicesList where ServiceName = @ServiceName and isEnd = 1 order by(StartTime) desc
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
select * from isaco.ServicesList inner join isaco.factors on factors.factorId = ServicesList.factorId where ServiceId = @ServiceId
)


--select * from FindOrderById(1)
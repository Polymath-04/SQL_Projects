Create database Assignment3;

use Assignment3;

select * from [dbo].[zomato(3)]


--/Task No. - 1

create procedure No_of_Booking
as
select RestaurantName,RestaurantType,CuisinesType,TableBooking from [dbo].[zomato(3)]
where TableBooking > 0
go

exec No_of_Booking;


--/Task No. - 2

BEGIN TRY
BEGIN TRANSACTION transaction_1
UPDATE [dbo].[zomato(3)] SET CuisinesType= 'Cafeteria'
WHERE CuisinesType='Cafe'
commit transaction
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION transaction_1
PRINT 'TRANSACTION ROLLEDBACK'
END CATCH

select * from [dbo].[zomato(3)];
rollback TRANSACTION transaction_1;


--/Task No. - 3

SELECT 
ROW_NUMBER() OVER (order by Rating desc) as Top_Ratings,
area,rating  FROM [dbo].[zomato(3)]

--/Task No. - 4

DECLARE @value INT 
SET @value=1
WHILE ( @value <= 50)
BEGIN
PRINT 'The value is = ' + CONVERT(VARCHAR,@value)
SET @value  = @value  + 1
END

--/Task No. - 5

CREATE VIEW top_Ratings_Jomato
AS
SELECT top(5) Rating,no_of_rating,
Cuisinestype,area,restaurantname
FROM [dbo].[zomato(3)]
GO


select * from top_Ratings_Jomato
order by Rating desc;

--/Task No. - 6
 
 CREATE TABLE data_modified
(
modification_date date default getdate() not null,
Changed_by varchar(30) DEFAULT current_user NOT NULL
);


CREATE TRIGGER trigger_insert ON [dbo].[zomato(3)]  
FOR INSERT,UPDATE,DELETE
AS 
BEGIN
insert into data_modified (modification_date,Changed_by)
select getdate(),SUSER_SNAME() 
from [dbo].[zomato(3)] 
END;

EXEC msdb.dbo.sp_send_dbmail 
@recipients     =   'youremails@yourdomain',
@subject        =   'Data Manipulated',
@body_format    =   'html',
@body           =   'New Record is inserted'


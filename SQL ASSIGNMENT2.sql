create database Assignment2;
use Assignment2;

select * from [dbo].[Jomato1]



--/ Task No. - 1
SET IMPLICIT_TRANSACTIONS ON;

begin try
begin transaction stuffing
create function stuff_chicken (@input as varchar(40))
returns table
as
return
update [dbo].[Jomato1] set RestaurantType = 'Quick Chicken Bites'
where RestaurantType = 'Quick Bites'
commit transaction
end try
begin catch
rollback transaction
print 'TRANSACTION ROLLEDBACK'
end catch

select * from [dbo].[Jomato1] 
rollback transaction stuffing

--/ Task No. - 2

Create function max_rating(@input int)
returns table 
return(
Select RestaurantName,CuisinesType,Rating from [dbo].[Jomato1] 
where Rating = (Select MAX(Rating) from [dbo].[Jomato1]) )
Select * from [dbo].[Jomato1]

select * from dbo.max_rating(300)



--/ Task No. - 3

SELECT *,
CASE 
WHEN Rating > 4 THEN 'Excellent'
WHEN Rating BETWEEN 3.5 AND 4 THEN 'Good'
WHEN Rating BETWEEN 3 AND 3.5 THEN 'Average'
ELSE 'Bad'
END
AS Rating_Status
FROM [dbo].[Jomato1] ;


--/ Task No. - 4

SELECT Rating, CEILING(Rating) AS ceil_value FROM [dbo].[Jomato1];

SELECT Rating, FLOOR(Rating) AS Floor_Value FROM [dbo].[Jomato1];

SELECT Rating, abs(Rating) AS Absolute_Value FROM [dbo].[Jomato1];

SELECT GETDATE() as Today
SELECT DATEPART(DAY, '04-03-2024') as day, 
       DATEPART(MONTH, '04-03-2024') as month,
       DATEPART(YEAR, '04-03-2024') as year

--/ Task No. - 5

SELECT RestaurantType as Restaurants, sum(AverageCost) AS average_cost
FROM [dbo].[Jomato1]
GROUP BY 
ROLLUP(RestaurantType, AverageCost);
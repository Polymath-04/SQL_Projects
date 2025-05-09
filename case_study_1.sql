use CaseStudy_1;


select * from [dbo].[fact]

select * from [dbo].[Location]

select * from [dbo].[Product]

--1

select count(distinct state) from location

--2

select count(type) from [dbo].[Product]
where type = 'regular'

--3

select sum(marketing) as spending from [dbo].[fact]
where productid = 1;

--4

select MIN(sales) from [dbo].[fact] as min_sales

--5

select MAX(COGS) from [dbo].[fact] as max_cogs

--6

select * from [dbo].[Product]
where product_type ='coffee'

--7

select * from [dbo].[fact] 
where total_expenses > 40

--8

select avg(sales) from [dbo].[fact] 
where area_code = 719

--9

select Area_Code,Profit from [dbo].[fact] as f
inner join
[dbo].[Location] as loc
on
f.Area_Code=loc.Area_Code
where Area_Code = 303 and profit = (select sum(profit) from Fact)

--10

select AVG(Inventory) as Avg_Inventory,ProductId from Fact 
group by ProductId

--11

select * from [dbo].[Location]
order by state;

--12

select Avg(Budget_Margin) as Avg_Margin from [dbo].[fact]
where Budget_Margin >100;

--13

select sum(sales) from [dbo].[fact]
where date = '2010-01-01';

--14

select AVG(Total_Expenses) as average,ProductId, Date from [dbo].[fact]
group by date,ProductId ;

--15

select f.date,f.productid,p.product_type,
p.product,f.sales,l.state,l.area_code from 
[dbo].[fact] f
inner join 
[dbo].[Product] p 
on f.productid = p.productid 
inner join 
[dbo].[Location] l
on f.area_code = l.area_code;

--16

select sales, dense_rank() over (order by sales asc) as rank from fact;

--17

select l.state,sum(profit) as profit,
sum(sales) as sales from [dbo].[fact] f 
inner join 
[dbo].[Location] l on f.Area_Code = l.Area_Code group by l.state;

--18

select l.state,sum(f.profit) as profit,
sum(f.sales) as sales,p.product from [dbo].[fact] f 
inner join
[dbo].[Location] l on f.area_code = l.area_code 
inner join
[dbo].[Product] p on p.productid = f.ProductId group by l.state, p.product;

--19

select productid, sales, (sales + sales*5/100) as increased_sale from [dbo].[fact];

--20

select p.productid, product_type, profit from [dbo].[fact] as f
inner join
[dbo].[Product] as p
on
f.productid=p.productid
where profit = (select max(profit) from fact)

--21

create procedure sp_product_type(@input varchar(25))
as 
select * from [dbo].[Product] where product_type=@input

exec sp_product_type 'espresso'

--22

select total_expenses, iif(total_expenses<60,'profit','loss') as total_expenses_status
from [dbo].[fact] 

--23

select datepart(week,date) as weekly , sum(sales) as total_weekly_sales,productid
from [dbo].[fact] 
group by rollup (productid,datepart(week,date))

--24

select area_code from [dbo].[fact] 
union 
select area_code from [dbo].[Location]

select area_code from [dbo].[fact] 
union all 
select area_code from [dbo].[Location]

select area_code from [dbo].[fact] 
intersect 
select area_code from [dbo].[Location]

--25

select * from [dbo].[Product] 

create function fn_product_type (@input varchar(25))
returns table 
as
return select * from [dbo].[Product] where product_type=@input

select * from [dbo].[fn_product_type] ('tea')
select * from [dbo].[fn_product_type] ('coffee')
select * from [dbo].[fn_product_type] ('herbal tea')

--26

begin tran t2
update [dbo].[Product] set product_type='tea'
where productid=1
select * from product
rollback tran t2
select * from product

--27

select productid, sales, date,total_expenses from [dbo].[fact]
where total_expenses between 100 and 200
order by total_expenses

--28
begin tran t1
delete from [dbo].[Product] where type='regular'
select * from [dbo].[Product]
rollback tran t1
select * from [dbo].[Product]

--29

select product, substring(product,5,1) as fifth_character,
ASCII(substring(product,5,1)) as ASCII_Value
from [dbo].[Product]


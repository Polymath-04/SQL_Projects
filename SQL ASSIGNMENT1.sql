create database parth1;

use parth1;



CREATE TABLE Salesman (
    SalesmanId INT not null,
    Name VARCHAR(255) not null,
    Commission DECIMAL(10, 2) not null,
    City VARCHAR(255) not null,
    Age INT not null
);

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);


CREATE TABLE Customer (
    SalesmanId INT not null,
    CustomerId INT not null,
    CustomerName VARCHAR(255),
    PurchaseAmount INT not null,
    );
	
INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);


CREATE TABLE Orders (
OrderId int not null, 
CustomerId int not null,
SalesmanId int not null, 
Orderdate Date not null,
Amount money not null
);

INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)
;

select * from Salesman;

select * from Customer;

select * from Orders;


--->>Tasks to be Performed:

--/Task No. - 1
insert into Orders Values
(5002,1575,103,'2023-04-17',4500),
(5004,2345,104,'2023-05-10',4000),
(5005,3747,107,'2023-06-20',2700),
(5006,4004,110,'2023-07-17',4545);


select * from orders;

--/Task No. - 2

ALTER TABLE Salesman
add constraint 
salesman_id primary key (salesmanid);

ALTER TABLE Salesman 
add constraint df_city
default 'ABCD' for city;

alter table Customer with nocheck
add constraint fk_customer
foreign key (salesmanid) references salesman(salesmanid)

alter table customer
alter column CustomerName VARCHAR(255) not null;



--/Task No. - 3
select * from Customer
where CustomerName = '%n' or
PurchaseAmount >500;



--/Task No. - 4
select Salesmanid from Salesman
union
select Salesmanid from Orders;

select Salesmanid from Salesman
union all
select Salesmanid from Orders;



--/Task No. - 5
select a.Name,a.commission,a.city,b.customerId as "Cust_Name",
b.customername,c.Amount as "amount"
from salesman a
inner join customer b
on a.SalesmanId = b.SalesmanId
inner join Orders c
on a.SalesmanId=c.SalesmanId
where PurchaseAmount between 500 and 1500;



--/Task No. - 6
select * from Salesman 
right join Orders 
on salesman.SalesmanId = Orders.SalesmanId;

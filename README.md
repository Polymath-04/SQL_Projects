# SQL_Projects

**Assignment 1 – Sales Order Processing System**
Project Title:
Sales Order Management for ABC Fashion

Objective:
This assignment demonstrates practical SQL skills by managing and querying a relational database for ABC Fashion's Sales Order Processing System. The focus is on data integrity, relationship mapping, constraints, and SQL operations to extract meaningful business insights.

Dataset:
The dataset consists of three primary tables:
> Salesman
> Customer
> Orders

-----

**Assignment 2 – Restaurant Data Analysis (Jomato Dataset)**
Project Title:
SQL-Based Restaurant Insights for Jomato-like Food Delivery Platform

Objective:
This assignment showcases SQL skills applied to real-world restaurant data from a Jomato-like food delivery platform. It involves user-defined functions, conditional logic, date handling, and aggregation to derive actionable insights for the client.

Dataset:
The dataset consists of restaurant data in a city, including:

Restaurant name

Cuisine type

Ratings

Restaurant type

Average cost, etc.

This data is used to perform analytical operations and generate business-relevant insights for a food delivery service.

-----

**Assignment 3 – Advanced SQL Operations on Jomato Dataset**
Project Title:
SQL Automation and Advanced Operations for Restaurant Analytics

Objective:
This assignment builds on advanced SQL concepts by working with a restaurant dataset provided by a Jomato-like food delivery platform. The focus is on procedures, transactions, triggers, views, and flow control constructs to manage data and automate business logic.

Dataset:
A structured dataset containing information about restaurants in a city, including:

Restaurant name and type

Cuisine

Ratings

Table booking status

Area/location

This data supports deep analysis and the implementation of SQL-based automation for real-time platforms.


----


**SQL Case Study 1 – Customer Sales and Profit Analysis**
Project Title:
Sales, Profit, and Product Insights from Customer Data

Objective:
This case study applies SQL concepts to analyze customer data from various states to understand patterns in sales, profit, marketing spend, COGS (Cost of Goods Sold), and other business KPIs. As a database administrator, your goal is to derive actionable insights from sample datasets to inform strategy and decision-making.

Dataset Description:
You have access to three interrelated tables:

FactTable (4,200 rows):
Contains sales data with the following fields:

> Date, ProductID, Profit, Sales, Margin, COGS, Total Expenses, Marketing, Inventory

> Budget Profit, Budget COGS, Budget Margin, Budget Sales, Area Code

ProductTable (13 rows)
Columns: Product Type, Product, ProductID, Type

LocationTable (156 rows)
Columns: Area Code, State, Market, Market Size


----


**SQL Case Study 2 – Employee & Department Database Analysis**
Project Title:
Relational SQL Analysis on Employee, Department, and Location Data

Objective:
The goal of this case study is to apply SQL techniques such as joins, subqueries, aggregation, and conditional logic to a simulated HR database. The analysis focuses on employee information, department distributions, job roles, salary insights, and data normalization using relational keys and constraints.

Dataset Description:
This case study consists of the following relational tables:

1. LOCATION Table:
| Column Name  | Data Type | Description        |
| ------------ | --------- | ------------------ |
| Location\_ID | INT (PK)  | Unique location ID |
| City         | VARCHAR   | City name          |



2. DEPARTMENT Table:
| **Column Name** | **Data Type** | **Description**                    |
| --------------- | ------------- | ---------------------------------- |
| `Department_ID` | INT (PK)      | Unique department ID               |
| `Name`          | VARCHAR       | Name of the department             |
| `Location_ID`   | INT (FK)      | References `Location(Location_ID)` |

3. JOB Table:
| **Column Name** | **Data Type** | **Description**       |
| --------------- | ------------- | --------------------- |
| `Job_ID`        | INT (PK)      | Unique job ID         |
| `Designation`   | VARCHAR       | Job designation/title |


4. EMPLOYEE Table :
| **Column Name** | **Data Type** | **Description**                        |
| --------------- | ------------- | -------------------------------------- |
| `Employee_ID`   | INT           | Unique employee ID                     |
| `Last_Name`     | VARCHAR       | Last name of the employee              |
| `First_Name`    | VARCHAR       | First name of the employee             |
| `Middle_Name`   | VARCHAR       | Middle initial (optional)              |
| `Job_ID`        | INT (FK)      | References `Job(Job_ID)`               |
| `Hire_Date`     | DATE          | Date when the employee was hired       |
| `Salary`        | DECIMAL       | Monthly salary of the employee         |
| `Comm`          | DECIMAL       | Commission (nullable)                  |
| `Department_ID` | INT (FK)      | References `Department(Department_ID)` |


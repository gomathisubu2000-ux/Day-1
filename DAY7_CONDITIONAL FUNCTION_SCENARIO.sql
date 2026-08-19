CREATE database conditional_function;
use conditional_function;
--- 1st ques
CREATE TABLE Student (
    Student_ID INT,
    Student_Name VARCHAR(100),
    Course VARCHAR(50),
    Marks INT
);

INSERT INTO Student VALUES
(1,'Aarav','SQL',85),
(2,'Diya','SQL',42),
(3,'Kabir','Python',50),
(4,'Meera','Python',30),
(5,'Rohan','Java',67),
(6,'Sara','Java',49),
(7,'Vihaan','SQL',90),
(8,'Ishita','Python',20),
(9,'Aditya','Java',55),
(10,'Priya','SQL',48);

select *,if(marks>=50,'pass','fail') as result
from student;
-- 6th ques
create table student2(
stu_id int,
stu_name varchar(100),
course varchar(50),
marks int);

INSERT INTO Student2 VALUES
(101,'Arun','CSE',95),
(102,'Priya','ECE',88),
(103,'Rahul','IT',76),
(104,'Sneha','EEE',69),
(105,'Karthik','CSE',55),
(106,'Divya','IT',91),
(107,'Vijay','ECE',82),
(108,'Anu','CSE',73),
(109,'Suresh','MECH',61),
(110,'Meena','CIVIL',49),
(111,'Ajay','IT',98),
(112,'Nisha','EEE',85);

select *,case when marks>=85 then 'scholership available'
when marks>=75 then ' minimum scholership available'
else ' no scholership' end as scholership_report
from student2;

--- 7th ques
create table loan_app(app_id int,
cus_name varchar(100),
mon_income decimal(10,2),
loan_amt decimal(10,2));

INSERT INTO Loan_App VALUES
(201,'Ravi',80000,500000),
(202,'Priya',60000,300000),
(203,'Arun',45000,200000),
(204,'Divya',30000,100000),
(205,'Kumar',90000,600000),
(206,'Meena',70000,350000),
(207,'John',50000,250000),
(208,'Anitha',25000,80000),
(209,'Vijay',100000,700000),
(210,'Suresh',40000,150000);

select *,case when mon_income>=75000 then ' loan approved'
when mon_income>=50000 then 'minimum amount loan approved'
else 'not approved' end as loan_approval
from loan_app;

-- 8th ques
create table product(
pro_id int,
pro_name varchar(100),
category varchar(50),
price decimal(10,2));

INSERT INTO Product VALUES
(301,'Laptop','Electronics',65000),
(302,'Mobile','Electronics',28000),
(303,'TV','Electronics',45000),
(304,'Chair','Furniture',3500),
(305,'Table','Furniture',8500),
(306,'Watch','Accessories',5500),
(307,'Shoes','Fashion',2500),
(308,'Bag','Fashion',1800),
(309,'Mixer','Home',4200),
(310,'AC','Electronics',52000),
(311,'Fan','Home',2400),
(312,'Refrigerator','Electronics',39000),
(313,'Sofa','Furniture',25000),
(314,'Keyboard','Electronics',1200),
(315,'Headphones','Electronics',3200);

select *,case when price>=25000 then '20% discount'
when price>=3000 then '5% discount'
else 'no discount' end as discount_category
from product;

-- 9th ques
create table patient(
patient_id int,
patient_name varchar(100),
age int,
health_score int);

INSERT INTO Patient VALUES
(401,'Arun',45,95),
(402,'Priya',32,85),
(403,'Ravi',60,72),
(404,'Meena',28,55),
(405,'John',40,91),
(406,'Divya',36,67),
(407,'Vijay',52,80),
(408,'Anu',30,49),
(409,'Kumar',65,88),
(410,'Sneha',27,77),
(411,'Ajay',50,58),
(412,'Nisha',43,93);

select *,case when health_score>=89 then 'no priority'
when health_score>=78 then 'less priority'
when health_score>=60 then 'high priority'
else 'critical' end as patient_priority
from patient;

-- 10th que
create table employee(
emp_id int,
emp_name varchar(100),
dep varchar(50),
salary decimal(10,2));

INSERT INTO Employee VALUES
(501,'Arun','IT',85000),
(502,'Priya','HR',62000),
(503,'Rahul','Sales',45000),
(504,'Sneha','Finance',32000),
(505,'John','IT',95000),
(506,'Divya','HR',55000),
(507,'Vijay','Sales',72000),
(508,'Meena','Finance',29000),
(509,'Ajay','IT',105000),
(510,'Anu','HR',48000),
(511,'Suresh','Sales',68000),
(512,'Kumar','Finance',38000),
(513,'Nisha','IT',76000),
(514,'Ravi','HR',51000),
(515,'Deepa','Sales',27000);
 select *, case when salary>=70000 then 'high salary'
 when salary>=45000 then 'medium  salary'
 else 'low salary' end as salary_band
 from employee;
 
-- 2nd ques
CREATE TABLE Employee2 (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee2 VALUES
(1,'Rahul','IT',75000),
(2,'Sneha','HR',45000),
(3,'Vikram','Sales',60000),
(4,'Anjali','IT',58000),
(5,'Karan','Finance',82000),
(6,'Pooja','HR',39000),
(7,'Arjun','Sales',61000),
(8,'Neha','Finance',55000),
(9,'Manish','IT',60500),
(10,'Divya','Sales',48000); 
select *, case when salary>=60000 then 'bonus eligible'
 else 'not eligible' end as bonus_employee
 from employee2;
 
--- 3rd ques
CREATE TABLE Customer (
    Customer_ID INT,
    Customer_Name VARCHAR(100),
    City VARCHAR(50),
    Purchase_Amount DECIMAL(10,2)
);

INSERT INTO Customer VALUES
(1,'Amit','Chennai',65000),
(2,'Bhavna','Mumbai',30000),
(3,'Chetan','Delhi',52000),
(4,'Deepa','Pune',48000),
(5,'Farhan','Chennai',75000),
(6,'Geeta','Delhi',25000),
(7,'Harish','Mumbai',60000),
(8,'Isha','Pune',15000),
(9,'Jatin','Chennai',55000),
(10,'Kavya','Delhi',40000),
(11,'Lokesh','Mumbai',90000),
(12,'Meena','Pune',20000);

select *, case when purchase_amount>=40000 then 'premium customer'
 else 'regular customer' end as customer_premium
 from customer;
 
--- 4th question
CREATE TABLE Product2 (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Stock_Quantity INT
);

INSERT INTO Product2 VALUES
(1,'Laptop','Electronics',10),
(2,'Mouse','Electronics',0),
(3,'Desk','Furniture',5),
(4,'Chair','Furniture',0),
(5,'Monitor','Electronics',8),
(6,'Notebook','Stationery',50),
(7,'Pen','Stationery',0),
(8,'Bookshelf','Furniture',3),
(9,'Keyboard','Electronics',0),
(10,'Marker','Stationery',20);

select *, case when stock_quantity >=3 then 'in stock'
 else 'out of stock' end as product_available
 from product2;
 
-- 5th ques
CREATE TABLE Employee_Performance (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Performance_Score INT,
    Department VARCHAR(50)
);

INSERT INTO Employee_Performance VALUES
(1,'Rahul',95,'IT'),
(2,'Sneha',82,'HR'),
(3,'Vikram',60,'Sales'),
(4,'Anjali',40,'IT'),
(5,'Karan',91,'Finance'),
(6,'Pooja',78,'HR'),
(7,'Arjun',55,'Sales'),
(8,'Neha',30,'Finance'),
(9,'Manish',88,'IT'),
(10,'Divya',65,'Sales'),
(11,'Aditya',99,'Finance'),
(12,'Ishita',45,'HR');

select *, case when performance_score>=85 then 'outstanding'
when performance_score>=60 then 'good'
 else 'average' end as employee_performance
 from Employee_Performance;
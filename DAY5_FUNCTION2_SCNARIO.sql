create database function2;
use function2;

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
(508,'Meena','Finance',29000);

select sum(salary) from employee;

CREATE TABLE Student (
    Student_ID INT,
    Student_Name VARCHAR(100),
    Course VARCHAR(50),
    Marks INT);

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

select avg(marks) from student;

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
(308,'Bag','Fashion',1800);

select max(price),min(price) from product;

 CREATE TABLE Customer1 (
    Customer_ID INT,
    Customer_Name VARCHAR(100),
    mobile_no varchar(50),
    price decimal(10,2));

INSERT INTO Customer1 VALUES
(1,'Amit Sharma','9876543210',10000),
(2,'Bhavna Iyer',null,15000),
(3,'Chetan Rao','9876543212',20000),
(4,'Deepa Nair','9876543213',30000),
(5,'Farhan Khan','9876543214',25000),
(6,'Geeta Reddy','9876543215',35000),
(7,'Harish Kumar','9876543216',10000),
(8,'Isha Verma','9876543217',40000),
(9,'Jatin Mehta','9876543218',45000),
(10,'Kavya Pillai','9876543219',50000),
(11,'Lokesh Gupta','9876543220',55000),
(12,'Meena Joshi','9876543221',20000);

select count(*) from customer1;

select count(*),sum(salary),avg(salary),max(salary),min(salary) from employee;
create database function1;
use function1;

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
(506,'Divya','HR',55000);

SELECT *,upper(emp_name) from employee;

create table product(
pro_id int,
pro_name varchar(100),
category varchar(50),
price decimal(10,2));

INSERT INTO Product VALUES
(301,'Laptop','Electronics',65000.82),
(302,'Mobile','Electronics',28000.56),
(303,'TV','Electronics',45000.71),
(304,'Chair','Furniture',-3500.60),
(305,'Table','Furniture',8500.99),
(306,'Watch','Accessories',5500.34),
(307,'Shoes','Fashion',2500.68),
(308,'Bag','Fashion',1800.17);

select price,round(price),ceil(price),floor(price) from product;

create table employee1(
emp_id int,
emp_name varchar(100),
join_date date,
dep varchar(50));

 INSERT INTO Employee1 VALUES
(1,'Rahul Sharma','2021-03-15','IT'),
(2,'Sneha Iyer','2019-07-22','HR'),
(3,'Vikram Rao','2022-11-05','Sales'),
(4,'Anjali Nair','2020-01-30','IT'),
(5,'Karan Mehta','2023-06-10','Finance'),
(6,'Pooja Reddy','2018-09-18','HR'),
(7,'Arjun Kumar','2024-02-25','Sales');

select emp_name,join_date,year(join_date),month(join_date),day(join_date) from employee1;

CREATE TABLE Customer (
    Customer_ID INT,
    Customer_Name VARCHAR(100),
    Mobile_No VARCHAR(15),
    Email VARCHAR(100)
);

INSERT INTO Customer VALUES
(1,'Amit Sharma','9876543210','amit@mail.com'),
(2,'Bhavna Iyer',NULL,'bhavna@mail.com'),
(3,'Chetan Rao','9876543212',NULL),
(4,'Deepa Nair',NULL,NULL),
(5,'Farhan Khan','9876543214','farhan@mail.com'),
(6,'Geeta Reddy','9876543215',NULL),
(7,'Harish Kumar',NULL,'harish@mail.com'),
(8,'Isha Verma','9876543217','isha@mail.com');

select *,ifnull(mobile_no,0),ifnull(email,0) from customer;

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

select student_name,marks,if(marks>=50,'pass','fail') from student;
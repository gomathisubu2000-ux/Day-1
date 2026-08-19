create database OPERATOR;
use operator;
create table employee(
emp_id int,
emp_name varchar(100),
dep varchar(50),
salary decimal(10,2),
age int);

INSERT INTO Employee  VALUES
(101,'Arun','HR',65000,32),
(102,'Bala','IT',72000,35),
(103,'Charan','Finance',58000,29),
(104,'Deepa','Marketing',81000,31),
(105,'Eswar','Sales',55000,34),
(106,'Farhana','IT',95000,40),
(107,'Gopi','HR',62000,30),
(108,'Hari','Finance',78000,36);

 select salary,salary+5000 as revised_salary
 from employee;
 
 create table employee1(
emp_id int,
emp_name varchar(100),
dep varchar(50),
salary decimal(10,2),
age int);

INSERT INTO Employee1  VALUES
(101,'Arun','HR',65000,32),
(102,'Bala','IT',72000,35),
(103,'Charan','sales',40000,29),
(104,'Deepa','Marketing',81000,31),
(105,'Eswar','Sales',55000,34),
(106,'Farhana','IT',95000,40),
(107,'Gopi','HR',62000,30),
(108,'Hari','Finance',78000,36),
(109,'Indhu','Sales',49000,28),
(110,'Jagan','Marketing',85000,33),
(111,'Karthik','IT',68000,37),
(112,'Lavanya','HR',61000,30);
update employee1
set salary=47000
where emp_id=109;

 select * from employee1
 where dep='sales'and salary>45000;
 
 select * from employee1
 where dep='hr'or dep='it'; 
 
 select * from employee1
 where dep in('hr','it');
 
  select * from employee1
 where emp_name like'a%' and  emp_name like '%n'; 
 
  create table employee2(
emp_id int,
emp_name varchar(100),
dep varchar(50),
salary decimal(10,2),
age int);

INSERT INTO Employee2  VALUES
(101,'Arun',null,65000,32),
(102,'Bala','it',72000,35),
(103,'Charan',null,40000,29),
(104,'Deepa','Marketing',81000,31),
(105,'Eswar','Sales',55000,34),
(106,'Farhana',null,95000,40),
(107,'Gopi','HR',62000,30),
(108,'Hari','Finance',78000,36),
(109,'Indhu',null,49000,28),
(110,'Jagan','Marketing',85000,33);

select * from employee2
where dep is null;

select * from employee2
where dep is not null;
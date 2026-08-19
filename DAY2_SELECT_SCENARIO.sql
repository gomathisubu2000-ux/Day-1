create database sqlassesment1;
use sqlassesment1;

create table employee(emp_id int,emp_name varchar(100),
dep varchar(50),salary decimal(10,2),city varchar(50));

insert into employee values(101,'john','it',50000,'chennai'),
(102,'mary','hr',35000,'bangalore'),
(103,'david','finance',60000,'hyderabad'),
(104,'sam','it',45000,'chennai'),
(105,'priya','hr',40000,'madurai');

-- 1st
select * from employee;
-- 2nd
select emp_name from employee;
-- 3rd 
select dep from employee;
-- 4th
select emp_name,salary from employee;
-- 5th
select emp_name,dep,city from employee;
-- 6th
select * from employee
where dep='hr';
-- 7th
select emp_name,salary from employee
where dep='finance';
-- 8th
select emp_name,city from employee;
-- 9th
select salary from employee;
-- 10th
select emp_id,emp_name,dep from employee;
-- 11th
create table student (stu_id int,
stu_name varchar(50),course varchar(20));
-- 12th
alter table student add email varchar(50);
-- 13th
insert into student(stu_id,stu_name,course) values(1,'vani','EEE');
-- 14th
commit;
-- 15th
select emp_id,emp_name,dep from employee;
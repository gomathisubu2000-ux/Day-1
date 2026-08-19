create database commands;
use commands;

-- 1st
create table Employee( EmpID int, Empname varchar (50), 
Dep varchar(30), Sal int(10));

insert into employee(empid,empname,dep,sal) values  
(101, 'John', 'IT', 45000), (102, 'Mary', 'HR', 35000), 
(103, 'David', 'finance', 55000), (104, 'Sam', 'It', 40000), 
(105, 'Priya', 'HR', 38000);

select * from employee;

-- 2nd
create table Students( stdID int, 
StuName varchar(50), Course varchar(30));  

insert into students (stdID, StuName, course) values 
(1, 'Rahul', 'sql'), (2, 'priya', 'python'), 
(3, 'Arun', 'PowerBI'), (4, 'Sneha', 'Java'), 
(5, 'Karthik', 'SQL'); 

Select * from students; 
alter table students 
add column email varchar (50);

-- 3rd
create table product( ProID int, 
Proname varchar(50), price int(10)); 
 
insert into product (proID, proname, price) values 
(101, 'laptop', 60000), (102, 'mouse', 800), 
(103, 'keyboard', 1200), (104, 'monitor', 15000), 
(105, 'printer', 9000);

select * from product; 
update product 
set price=2500
where proid=103;
select * from product; 

-- 4th
create table patient( patID int, 
patName varchar(50), Disease varchar(50)); 
  
insert into patient (patID, patName, disease) values 
(1, 'ramesh', 'fever'), (2, 'suresh', 'cold'), 
(3, 'anitha', 'diabetes'), (4, 'meena', 'asthma'), 
(5, 'kumar', 'typhoid');

select * from patient;
delete from patient
where patid=2;
select * from patient;

-- 5th
create table event_registration( stuID int, 
stuName varchar(50), eventName varchar(50));  

insert into event_registration (stuID, stuName, eventName) values 
(1, 'rahul', 'dance'), (2, 'priya', 'singing'), 
(3, 'arun', 'drawing'), (4, 'sneha', 'quiz'), 
(5, 'karthik', 'drama');

select * from event_registration;
 truncate table event_registration;

-- 6th
create table Employee1( EmpID int, 
EmpName varchar (50), Sal int(10)); 

insert into employee1 (empID, empName, sal) values 
(101, 'john', 45000), (102, 'mary', 35000), 
(103, 'david', 50000), (104, 'sam', 43000), 
(105, 'priya', 39000);

select * from employee1; 
rename table employee1 to staff; 
select * from staff; 

-- 7th
create table accounts( accNo int, 
CusName varchar(50), Balance int); 

insert into accounts (accNo, cusName, Balance) values 
(1001, 'john', 50000), (1002, 'mary', 30000), 
(1003, 'david', 70000), (1004, 'sam', 45000), 
(1005, 'priya', 60000); 

select * from accounts; 
update accounts 
set balance = 35000 
where accno = 1002;
commit;

-- 8th
create table Book( bookID int, 
BookName varchar(50), Author varchar(50)); 
 
insert into book (bookID, BookName, Author) values 
(1, 'sql basics', 'james'), (2, 'python guide', 'robert'), 
(3, 'java programming', 'john'), (4, 'power BI', 'david'), 
(5, 'data science', 'peter'); 

select *from book;
Delete from book 
where bookID = 3; 
rollback;

-- 9th
grant select on employee to student1;

-- 10th
create table customer_details2026( cusID int, 
cusName varchar(50), city varchar(50)); 

insert into customer_details2026 (cusID, cusName, city) values 
(1, 'john', 'chennai'), (2, 'mary', 'bangalore'), 
(3, 'david', 'hyderabad'), (4, 'sam', 'coimbatore'), 
(5, 'priya', 'madurai'); 

select*from customer_details2026; 
drop table customer_details2026;
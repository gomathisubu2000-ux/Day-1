create database indexing;
use indexing;
create table employee(
emp_id int,emp_name varchar(100),
email varchar(100), dep varchar(50),
sal decimal(10,2));

INSERT INTO Employee (Emp_ID, Emp_Name, Email, Dep, Sal) VALUES
(1, 'Arun Kumar',     'arun.kumar@company.com',     'HR',        45000.00),
(2, 'Priya Sharma',   'priya.sharma@company.com',   'Finance',   52000.00),
(3, 'Ravi Teja',      'ravi.teja@company.com',      'IT',        60000.00),
(4, 'Sneha Reddy',    'sneha.reddy@company.com',    'Marketing', 48000.00),
(5, 'Kiran Babu',     'kiran.babu@company.com',     'IT',        61000.00),
(6, 'Divya Menon',    'divya.menon@company.com',    'HR',        47000.00),
(7, 'Suresh Nair',    'suresh.nair@company.com',    'Finance',   53000.00),
(8, 'Anjali Verma',   'anjali.verma@company.com',   'Sales',     42000.00),
(9, 'Vikram Rao',     'vikram.rao@company.com',     'IT',        62000.00),
(10, 'Meena Iyer',    'meena.iyer@company.com',     'Marketing', 49000.00);

create index email_idx
on employee(email);

SELECT *
FROM Employee
WHERE Email = 'ravi.teja@company.com';

create table product(
pro_id int, pro_name varchar(100),
category varchar(50),price decimal(10,2),
brand varchar(50));

INSERT INTO Product  VALUES
(1, 'Laptop Pro 15',     'Electronics', 65000.00, 'Dell'),
(2, 'Smartphone X',      'Electronics', 55000.00, 'Samsung'),
(3, 'Wireless Earbuds',  'Electronics', 3500.00,  'boAt'),
(4, 'Office Chair',      'Furniture',   8500.00,  'Featherlite'),
(5, '4K Smart TV',       'Electronics', 72000.00, 'LG'),
(6, 'Study Table',       'Furniture',   6200.00,  'IKEA'),
(7, 'Gaming Console',    'Electronics', 48000.00, 'Sony'),
(8, 'Bluetooth Speaker', 'Electronics', 4200.00,  'JBL'),
(9, 'Sofa Set',          'Furniture',   35000.00, 'Urban Ladder'),
(10, 'Tablet Air',       'Electronics', 51000.00, 'Apple');

create index idx_composite
on product(category,price);

select * from product 
where category='electronics'and price>50000;

CREATE TABLE Employee1 (
Emp_ID INT,Emp_Name VARCHAR(100),Department VARCHAR(50),Salary DECIMAL(10,2));

create table emp_log(
log_id int auto_increment primary key,emp_id int,
action_performed varchar(50),
action_time datetime);

delimiter **
create trigger trg_after_insert
after insert 
on employee1
for each row
begin 
insert into emp_log(emp_id,action_performed,action_time) values
(new.emp_id,'inserted',now());
end **
delimiter ;

INSERT INTO Employee1 VALUES
(1,'Rahul','IT',75000);

select * from emp_log;

create table employee2(emp_id int,emp_name varchar(100),sal decimal(10,2));

INSERT INTO Employee2 VALUES
(1,'Rahul',75000),(2,'Sneha',82000),(3,'Vikram',82000);

delimiter $$
create trigger trg_before_update
after update 
on employee
for each row
begin 
if new.sal<0 then
signal sqlstate'45000'
set message_text='salary cannot be negative';
end if;
end $$
delimiter ;

update employee set sal=-5000
where emp_id=1;

update employee set sal=48000
where emp_id=1;

select * from employee2;

create table customer(
cus_id int,cus_name varchar(100),
email varchar(100),age int);

create unique index idx_email
on customer(email);

delimiter &&
create trigger trg_before_insert
before insert 
on customer
for each row
begin 
if new.age < 18 then
signal sqlstate '45000'
set message_text='customer must be at least 18 years old';
end if;
end &&
delimiter ;
 
insert into customer values(1,'meena','meena@gmail.com',25);
insert into customer values(2,'mani','mani@gmail.com',15);
insert into customer values(3,'meena duplicate','meena@gmail.com',30);

select *from customer;
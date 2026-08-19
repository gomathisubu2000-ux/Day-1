create database clause;
use clause;
create table employee(
emp_id int,
emp_name varchar(100),
dep varchar(50),
salary decimal(10,2),
experience int);

INSERT INTO Employee VALUES
(101,'Arun','IT',85000,5),
(102,'Bala','IT',90000,6),
(103,'Charan','IT',75000,4),
(104,'Deepa','HR',65000,7),
(105,'Eswar','HR',62000,5),
(106,'Farhana','HR',58000,3),
(107,'Gopi','Finance',95000,8),
(108,'Hari','Finance',92000,7),
(109,'Indhu','Finance',88000,6),
(110,'Jagan','Marketing',70000,4),
(111,'Karthik','Marketing',68000,5),
(112,'Lavanya','Marketing',72000,6),
(113,'Manoj','Sales',55000,3),
(114,'Nisha','Sales',60000,4),
(115,'Praveen','Sales',58000,2);

select dep,avg(salary)
from employee
group by dep
having avg(salary)>60000
order by avg(salary) desc
limit 3;
 
create table sales(
sale_id int,
product_name varchar(100),
category varchar(50),
quantity int,
sale_date date);
INSERT INTO Sales VALUES
(1,'Laptop','Electronics',40,'2025-01-05'),
(2,'Mobile','Electronics',50,'2025-01-10'),
(3,'Headphones','Electronics',30,'2025-01-15'),
(4,'Shirt','Clothing',45,'2025-01-08'),
(5,'Jeans','Clothing',40,'2025-01-12'),
(6,'T-Shirt','Clothing',35,'2025-01-18'),
(7,'Rice','Grocery',60,'2025-01-03'),
(8,'Oil','Grocery',50,'2025-01-09'),
(9,'Sugar','Grocery',40,'2025-01-20'),
(10,'Sofa','Furniture',35,'2025-01-04'),
(11,'Table','Furniture',40,'2025-01-14'),
(12,'Chair','Furniture',45,'2025-01-22'),
(13,'Cricket Bat','Sports',55,'2025-01-06'),
(14,'Football','Sports',40,'2025-01-11'),
(15,'Tennis Ball','Sports',30,'2025-01-19'),
(16,'Novel','Books',25,'2025-01-07'),
(17,'Dictionary','Books',30,'2025-01-16'),
(18,'Face Wash','Beauty',50,'2025-01-02'),
(19,'Shampoo','Beauty',45,'2025-01-13'),
(20,'Cream','Beauty',35,'2025-01-25');

select category,sum(quantity)
from sales
group by category
having sum(quantity)>100
order by sum(quantity) desc
limit 5; 

create table customer(
cus_id int,
cus_name varchar(100),
city varchar(50),
purchase_amt decimal(10,2));

INSERT INTO Customer  VALUES
(101,'Arun','Chennai',18000),
(102,'Bala','Coimbatore',26000),
(103,'Charan','Madurai',45000),
(104,'Deepa','Chennai',32000),
(105,'Eswar','Salem',15000),
(106,'Farhana','Trichy',27000),
(107,'Gopi','Erode',38000),
(108,'Hari','Chennai',52000),
(109,'Indhu','Madurai',21000),
(110,'Jagan','Coimbatore',62000),
(111,'Karthik','Salem',28000),
(112,'Lavanya','Trichy',19000),
(113,'Manoj','Erode',35000),
(114,'Nisha','Chennai',42000),
(115,'Praveen','Madurai',25000);

select *
from customer
where purchase_amt>=25000
order by cus_name asc; 

create table patient(
patient_id int,
patient_name varchar(100),
dep varchar(50),
treatment_cost decimal(10,2));

INSERT INTO Patient  VALUES
(1,'Arun','Cardiology',5000),
(2,'Bala','Cardiology',6500),
(3,'Charan','Cardiology',7000),
(4,'Deepa','Cardiology',4500),
(5,'Eswar','Neurology',9000),
(6,'Farhana','Neurology',8200),
(7,'Gopi','Neurology',7800),
(8,'Hari','Neurology',9600),
(9,'Indhu','Orthopedics',6000),
(10,'Jagan','Orthopedics',7200),
(11,'Karthik','Orthopedics',6800),
(12,'Lavanya','Pediatrics',3500),
(13,'Manoj','Pediatrics',3200),
(14,'Nisha','Dermatology',2800),
(15,'Praveen','Cardiology',5300),
(16,'Ravi','Cardiology',6100),
(17,'Sneha','Neurology',8700),
(18,'Tamil','Orthopedics',7100),
(19,'Uma','Cardiology',4900),
(20,'Vijay','Pediatrics',3400);

select dep,count(patient_id)
from patient
group by dep
having count(patient_id)>3
order by count(patient_id) desc; 

select dep,count(*)
from patient
group by dep
having count(*)>3
order by count(*) desc; 

create table employee1(
emp_id int,
emp_name varchar(100),
dep varchar(50),
salary decimal(10,2),
age int);

INSERT INTO Employee1  VALUES
(101,'Arun','HR',65000,32),
(102,'Bala','IT',72000,35),
(103,'Charan','Finance',58000,29),
(104,'Deepa','Marketing',81000,31),
(105,'Eswar','Sales',55000,34),
(106,'Farhana','IT',95000,40),
(107,'Gopi','HR',62000,30),
(108,'Hari','Finance',78000,36),
(109,'Indhu','Sales',49000,28),
(110,'Jagan','Marketing',85000,33),
(111,'Karthik','IT',68000,37),
(112,'Lavanya','HR',61000,30),
(113,'Manoj','Finance',75000,41),
(114,'Nisha','Sales',53000,27),
(115,'Praveen','IT',99000,45);

select *
from employee1
where age>=30 and salary>=60000
order by salary desc
limit 5; 

Create database window_function;
use window_function;

CREATE TABLE Employee (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee VALUES
(1,'Rahul','IT',75000),(2,'Sneha','IT',82000),(3,'Vikram','IT',82000),
(4,'Anjali','HR',45000),(5,'Karan','HR',60000),(6,'Pooja','HR',60000),
(7,'Arjun','Sales',55000),(8,'Neha','Sales',70000),(9,'Manish','Sales',48000),
(10,'Divya','Finance',90000),(11,'Aditya','Finance',65000),(12,'Ishita','Finance',65000),
(13,'Suresh','IT',60000),(14,'Meena','HR',52000),(15,'Ramesh','Sales',61000);

select emp_id,emp_name,department,salary,Row_number () over(order by salary desc) as salary_sequence 
from employee;

CREATE TABLE Employee1 (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee1 VALUES
(1,'Rahul','IT',75000),(2,'Sneha','IT',82000),(3,'Vikram','IT',82000),
(4,'Anjali','HR',45000),(5,'Karan','HR',60000),(6,'Pooja','HR',60000),
(7,'Arjun','Sales',55000),(8,'Neha','Sales',70000),(9,'Manish','Sales',48000),
(10,'Divya','Finance',90000),(11,'Aditya','Finance',65000),(12,'Ishita','Finance',65000),
(13,'Suresh','IT',60000),(14,'Meena','HR',52000),(15,'Ramesh','Sales',61000),
(16,'Kavita','Finance',55000),(17,'Tarun','IT',95000),(18,'Nisha','HR',48000),
(19,'Gopal','Sales',72000),(20,'Priyanka','Finance',80000);

select emp_name,department,salary,rank () over(partition by department  order by salary desc) as salary_rank 
from employee1;

CREATE TABLE Employee2 (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Branch VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee2 VALUES
(101,'Rahul','Chennai',75000),(102,'Sneha','Chennai',82000),(103,'Vikram','Chennai',60000),
(104,'Anjali','Mumbai',45000),(105,'Karan','Mumbai',60000),(106,'Pooja','Mumbai',52000),
(107,'Arjun','Delhi',55000),(108,'Neha','Delhi',70000),(109,'Manish','Delhi',48000),
(110,'Divya','Chennai',90000),(111,'Aditya','Mumbai',65000),(112,'Ishita','Delhi',65000),
(113,'Suresh','Chennai',60000),(114,'Meena','Mumbai',52000),(115,'Ramesh','Delhi',61000),
(116,'Kavita','Chennai',55000),(117,'Tarun','Mumbai',95000),(118,'Nisha','Delhi',48000);

select emp_id,emp_name,branch,Row_number () over(partition by branch ) as employee_no
from employee2;

CREATE TABLE Employee3 (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee3 VALUES
(1,'Rahul',75000),(2,'Sneha',82000),(3,'Vikram',82000),(4,'Anjali',45000),
(5,'Karan',60000),(6,'Pooja',60000),(7,'Arjun',55000),(8,'Neha',70000),
(9,'Manish',48000),(10,'Divya',90000),(11,'Aditya',65000),(12,'Ishita',65000),
(13,'Suresh',60000),(14,'Meena',52000),(15,'Ramesh',61000);

select emp_name,salary,dense_Rank () over(order by salary ) as salary_rank 
from employee3;

CREATE TABLE Employee4 (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Branch VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee4 VALUES
(1,'Rahul','Chennai','IT',75000),(2,'Sneha','Chennai','IT',85000),
(3,'Vikram','Chennai','HR',60000),(4,'Anjali','Chennai','HR',58000),
(5,'Karan','Mumbai','IT',70000),(6,'Pooja','Mumbai','IT',95000),
(7,'Arjun','Mumbai','HR',55000),(8,'Neha','Mumbai','HR',62000),
(9,'Manish','Delhi','IT',80000),(10,'Divya','Delhi','IT',80000),
(11,'Aditya','Delhi','HR',48000),(12,'Ishita','Delhi','HR',52000),
(13,'Suresh','Chennai','IT',60000),(14,'Meena','Chennai','HR',65000),
(15,'Ramesh','Mumbai','IT',72000),(16,'Kavita','Mumbai','HR',58000),
(17,'Tarun','Delhi','IT',90000),(18,'Nisha','Delhi','HR',47000),
(19,'Gopal','Chennai','Sales',66000),(20,'Priyanka','Mumbai','Sales',77000),
(21,'Suman','Delhi','Sales',69000),(22,'Anil','Chennai','Sales',71000),
(23,'Rekha','Mumbai','Sales',59000),(24,'Deepak','Delhi','Sales',63000),
(25,'Farah','Chennai','IT',68000);

select emp_name,branch,department,salary,rank () over(partition by branch,department order by salary ) as rank_no 
from employee4;

CREATE TABLE Employee5 (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee5 VALUES
(1,'Rahul',75000),(2,'Sneha',82000),(3,'Vikram',82000),(4,'Anjali',45000),
(5,'Karan',60000),(6,'Pooja',60000),(7,'Arjun',55000),(8,'Neha',70000),
(9,'Manish',48000),(10,'Divya',90000),(11,'Aditya',65000),(12,'Ishita',65000),
(13,'Suresh',60000),(14,'Meena',52000),(15,'Ramesh',61000),(16,'Kavita',55000),
(17,'Tarun',95000),(18,'Nisha',48000),(19,'Gopal',72000),(20,'Priyanka',80000);

select emp_name,salary,Row_number () over(order by emp_name asc )as salary_tie
from employee5;

CREATE TABLE Employee6 (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Experience INT,
    Salary DECIMAL(10,2)
);

INSERT INTO Employee6 VALUES
(1,'Rahul','IT',5,75000),(2,'Sneha','IT',8,82000),(3,'Vikram','IT',8,79000),
(4,'Anjali','HR',3,45000),(5,'Karan','HR',6,60000),(6,'Pooja','HR',6,63000),
(7,'Arjun','Sales',4,55000),(8,'Neha','Sales',7,70000),(9,'Manish','Sales',2,48000),
(10,'Divya','Finance',10,90000),(11,'Aditya','Finance',5,65000),(12,'Ishita','Finance',5,68000),
(13,'Suresh','IT',3,60000),(14,'Meena','HR',6,52000),(15,'Ramesh','Sales',4,61000),
(16,'Kavita','Finance',3,55000),(17,'Tarun','IT',9,95000),(18,'Nisha','HR',2,48000),
(19,'Gopal','Sales',7,72000),(20,'Priyanka','Finance',8,80000);

select emp_name,department,experience,salary,rank() over( partition by department order by experience desc) as exp_rank 
from employee6;

CREATE TABLE Employee7 (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Country VARCHAR(50),
    Branch VARCHAR(50),
    Salary DECIMAL(10,2),
    Experience INT
);

INSERT INTO Employee7 VALUES
(1,'Rahul','India','Chennai',75000,5),(2,'Sneha','India','Chennai',85000,8),
(3,'Vikram','India','Chennai',85000,6),(4,'Anjali','India','Mumbai',60000,3),
(5,'Karan','India','Mumbai',60000,6),(6,'Pooja','India','Mumbai',95000,7),
(7,'Arjun','USA','NewYork',55000,4),(8,'Neha','USA','NewYork',70000,7),
(9,'Manish','USA','NewYork',48000,2),(10,'Divya','USA','Boston',90000,10),
(11,'Aditya','USA','Boston',65000,5),(12,'Ishita','USA','Boston',65000,5),
(13,'Suresh','India','Chennai',60000,3),(14,'Meena','India','Mumbai',52000,6),
(15,'Ramesh','USA','NewYork',61000,4),(16,'Kavita','USA','Boston',55000,3),
(17,'Tarun','India','Chennai',95000,9),(18,'Nisha','USA','NewYork',48000,2),
(19,'Gopal','India','Mumbai',72000,7),(20,'Priyanka','USA','Boston',80000,8),
(21,'Suman','India','Chennai',68000,4),(22,'Anil','USA','NewYork',71000,6),
(23,'Rekha','India','Mumbai',59000,3),(24,'Deepak','USA','Boston',63000,4),
(25,'Farah','India','Chennai',68000,5),(26,'Rohit','India','Mumbai',59000,4),
(27,'Sonal','USA','NewYork',71000,6),(28,'Vivek','USA','Boston',63000,3),
(29,'Nikita','India','Chennai',60000,3),(30,'Yash','USA','NewYork',48000,2);

select emp_name,country,branch,salary,experience,Rank () over(partition by country,branch order by salary desc) as salary 
from employee7;

select emp_name,country,branch,salary,experience,Rank () over(partition by country,branch order by experience desc) as exp 
from employee7;

select emp_name,country,branch,salary,experience,Rank () over(partition by country,branch order by emp_name) as salary 
from employee7;

CREATE TABLE Product (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Product VALUES
(1,'Laptop A','Electronics',75000),(2,'Laptop B','Electronics',75000),
(3,'Mouse','Electronics',500),(4,'Keyboard','Electronics',1200),
(5,'Desk','Furniture',8000),(6,'Chair','Furniture',3500),
(7,'Bookshelf','Furniture',3500),(8,'Sofa','Furniture',15000),
(9,'Notebook','Stationery',50),(10,'Pen','Stationery',10),
(11,'Marker','Stationery',15),(12,'Diary','Stationery',120),
(13,'Monitor','Electronics',12000),(14,'Printer','Electronics',6000),
(15,'Table Lamp','Furniture',1500),(16,'File Folder','Stationery',30),
(17,'Headphones','Electronics',2000),(18,'Wardrobe','Furniture',20000),
(19,'Stapler','Stationery',80),(20,'Speaker','Electronics',2000);

select product_name,category,price,Rank () over(partition by category order by price desc) as price_rank 
from product;

CREATE TABLE Orders (
    Order_ID INT,
    Customer_ID INT,
    Order_Status VARCHAR(30),
    Order_Date DATE,
    Order_Amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(1,101,'Delivered','2024-01-10',2500),(2,101,'Delivered','2024-03-15',4000),
(3,101,'Pending','2024-02-20',1500),(4,102,'Delivered','2024-01-05',3000),
(5,102,'Delivered','2024-01-05',5000),(6,102,'Cancelled','2024-02-01',1200),
(7,103,'Delivered','2024-04-01',2200),(8,103,'Pending','2024-03-10',1800),
(9,103,'Pending','2024-03-10',2100),(10,104,'Delivered','2024-01-20',3500),
(11,104,'Cancelled','2024-02-15',900),(12,101,'Delivered','2024-02-01',3200),
(13,102,'Pending','2024-03-05',1600),(14,105,'Delivered','2024-01-25',4200),
(15,105,'Delivered','2024-04-10',2900),(16,105,'Pending','2024-02-28',1100),
(17,103,'Delivered','2024-01-15',2700),(18,104,'Delivered','2024-03-22',5200),
(19,101,'Cancelled','2024-01-30',800),(20,102,'Delivered','2024-04-05',6000),
(21,106,'Delivered','2024-02-10',3300),(22,106,'Pending','2024-03-01',1900),
(23,106,'Delivered','2024-01-18',2600),(24,107,'Delivered','2024-02-25',4700),
(25,107,'Cancelled','2024-03-08',700),(26,107,'Pending','2024-01-12',1300),
(27,108,'Delivered','2024-04-15',3900),(28,108,'Delivered','2024-02-05',3900),
(29,108,'Pending','2024-03-18',2000),(30,109,'Delivered','2024-01-08',5500);

select customer_id,order_id,order_status,order_date,order_amount,
row_number () over(partition by customer_id order by order_date desc) as cus_order 
from orders;

select customer_id,order_id,order_status,order_date,order_amount,
row_number () over(partition by order_status order by order_date desc) as cus_order 
from orders;

select customer_id,order_id,order_status,order_date,order_amount,
row_number () over(partition by customer_id order by order_amount desc) as cus_order 
from orders;

select customer_id,order_id,order_status,order_date,order_amount,
row_number () over(partition by order_status order by order_amount desc) as cus_order 
from orders;

use subquery;
CREATE TABLE Employee1 (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Experience INT,
    Salary DECIMAL(10,2)
);

INSERT INTO Employee1 VALUES
(1,'Rahul','IT',5,75000),(2,'Sneha','IT',8,82000),(3,'Vikram','IT',8,79000),
(4,'Anjali','HR',3,45000),(5,'Karan','HR',6,60000),(6,'Pooja','HR',6,63000),
(7,'Arjun','Sales',4,55000),(8,'Neha','Sales',7,70000),(9,'Manish','Sales',2,48000),
(10,'Divya','Finance',10,90000),(11,'Aditya','Finance',5,65000),(12,'Ishita','Finance',5,68000),
(13,'Suresh','IT',3,60000),(14,'Meena','HR',6,52000),(15,'Ramesh','Sales',4,61000);

select emp_id,emp_name,department,salary from employee1 e1
where salary>(select avg(salary) from employee1 e1 where department=e1.department)
order by salary desc;
select avg(salary) from employee1 e1 where department=e1.department;

CREATE TABLE Employee2 (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Experience INT,
    Salary DECIMAL(10,2)
);

INSERT INTO Employee2 VALUES
(1,'Rahul','IT',5,75000),(2,'Sneha','IT',8,82000),(3,'Vikram','IT',8,79000),
(4,'Anjali','HR',3,45000),(5,'Karan','HR',6,60000),(6,'Pooja','HR',6,63000),
(7,'Arjun','Sales',4,55000),(8,'Neha','Sales',7,70000),(9,'Manish','Sales',2,48000),
(10,'Divya','Finance',10,90000),(11,'Aditya','Finance',5,65000),(12,'Ishita','Finance',5,68000),
(13,'Suresh','IT',3,60000),(14,'Meena','HR',6,52000),(15,'Ramesh','Sales',4,61000),
(16,'Kavita','Finance',3,55000),(17,'Tarun','IT',9,95000),(18,'Nisha','HR',2,48000),
(19,'Gopal','Sales',7,72000),(20,'Priyanka','Finance',8,80000);

select emp_name,department,salary,experience from employee2 where max(salary)>(select salary from employee2 where depaetment)
order by salary desc;

select emp_name,department,experience,salary from employee2 
where (department,experience) in (select department,experience from employee2 where department='finance')
order by experience desc;

-- 7th ques
CREATE TABLE Employee4 (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Manager_ID INT,
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee4 VALUES
(1,'Rahul Sharma',NULL,'Executive',150000),
(2,'Sneha Iyer',1,'IT',95000),
(3,'Vikram Rao',1,'Finance',92000),
(4,'Anjali Nair',1,'HR',88000),
(5,'Karan Mehta',2,'IT',75000),
(6,'Pooja Reddy',2,'IT',72000),
(7,'Arjun Kumar',3,'Finance',68000),
(8,'Neha Verma',3,'Finance',65000),
(9,'Manish Gupta',4,'HR',60000),
(10,'Divya Joshi',4,'HR',58000),
(11,'Aditya Singh',5,'IT',55000),
(12,'Ishita Kapoor',5,'IT',54000),
(13,'Suresh Pillai',6,'IT',52000),
(14,'Meena Nambiar',7,'Finance',50000),
(15,'Ramesh Chandran',8,'Finance',48000),
(16,'Kavita Menon',9,'HR',45000),
(17,'Tarun Bhatt',10,'HR',44000),
(18,'Nisha Kulkarni',1,'Sales',90000),
(19,'Gopal Krishnan',18,'Sales',60000),
(20,'Priyanka Das',18,'Sales',58000);
-- 3th ques
CREATE TABLE Customer (
    Customer_ID INT, Customer_Name VARCHAR(100), City VARCHAR(50)
);
INSERT INTO Customer VALUES
(1,'Amit Sharma','Chennai'),(2,'Bhavna Iyer','Mumbai'),(3,'Chetan Rao','Delhi'),
(4,'Deepa Nair','Pune'),(5,'Farhan Khan','Chennai'),(6,'Geeta Reddy','Delhi'),
(7,'Harish Kumar','Mumbai'),(8,'Isha Verma','Pune'),(9,'Jatin Mehta','Chennai'),
(10,'Kavya Pillai','Delhi'),(11,'Lokesh Gupta','Mumbai'),(12,'Meena Joshi','Pune'),
(13,'Nitin Bhatt','Chennai'),(14,'Om Prakash','Delhi'),(15,'Priya Nambiar','Mumbai');

CREATE TABLE Orders (
    Order_ID INT, Customer_ID INT, Order_Amount DECIMAL(10,2), Order_Date DATE
);
INSERT INTO Orders VALUES
(101,1,2500,'2024-01-10'),(102,1,4000,'2024-03-15'),(103,2,3000,'2024-01-05'),
(104,2,5000,'2024-02-01'),(105,3,2200,'2024-04-01'),(106,3,1800,'2024-03-10'),
(107,4,3500,'2024-01-20'),(108,4,900,'2024-02-15'),(109,5,4200,'2024-01-25'),
(110,5,2900,'2024-04-10'),(111,6,3300,'2024-02-10'),(112,6,1900,'2024-03-01'),
(113,7,2600,'2024-01-18'),(114,7,4700,'2024-02-25'),(115,8,700,'2024-03-08'),
(116,8,1300,'2024-01-12'),(117,9,3900,'2024-04-15'),(118,9,2000,'2024-02-05'),
(119,10,5500,'2024-01-08'),(120,10,3100,'2024-03-20'),(121,11,6200,'2024-02-14'),
(122,11,2800,'2024-01-22'),(123,12,3600,'2024-03-30'),(124,13,4100,'2024-02-18'),
(125,14,2400,'2024-01-05');
-- 4th ques
CREATE TABLE Employee3 (
    Emp_ID INT, Emp_Name VARCHAR(100), Department VARCHAR(50),
    Salary DECIMAL(10,2), Age INT
);
INSERT INTO Employee3 VALUES
(1,'Rahul','IT',75000,29),(2,'Sneha','IT',82000,31),(3,'Vikram','IT',60000,26),
(4,'Anjali','HR',45000,24),(5,'Karan','HR',60000,35),(6,'Pooja','HR',52000,28),
(7,'Arjun','Sales',55000,30),(8,'Neha','Sales',70000,33),
(9,'Manish','Finance',90000,40),(10,'Divya','Finance',65000,27),
(11,'Aditya','Finance',68000,29),(12,'Ishita','Finance',55000,25),
(13,'Suresh','IT',60000,32),(14,'Meena','HR',58000,26),
(15,'Ramesh','Sales',61000,31),(16,'Kavita','Finance',72000,34),
(17,'Tarun','IT',95000,38),(18,'Nisha','HR',48000,23),
(19,'Gopal','Sales',66000,29),(20,'Priyanka','Finance',80000,36);
select emp_name,age,salary from employee1 e1
where salary>(select avg(salary) from employee1 e1 where department=e1.department)
order by salary desc;

-- 5th ques
CREATE TABLE Product (
    Product_ID INT, Product_Name VARCHAR(100), Category VARCHAR(50), Price DECIMAL(10,2)
);
INSERT INTO Product VALUES
(1,'Laptop','Electronics',75000),(2,'Mouse','Electronics',500),
(3,'Keyboard','Electronics',1200),(4,'Monitor','Electronics',12000),
(5,'Printer','Electronics',6000),(6,'Headphones','Electronics',2000),
(7,'Desk','Furniture',8000),(8,'Chair','Furniture',3500),
(9,'Bookshelf','Furniture',3500),(10,'Sofa','Furniture',15000),
(11,'Wardrobe','Furniture',20000),(12,'Table Lamp','Furniture',1500),
(13,'Notebook','Stationery',50),(14,'Pen','Stationery',10),
(15,'Marker','Stationery',15),(16,'Diary','Stationery',120),
(17,'Stapler','Stationery',80),(18,'File Folder','Stationery',30),
(19,'Speaker','Electronics',2000),(20,'Backpack','Accessories',1800);

CREATE TABLE Order_Items (
    Order_ID INT, Product_ID INT, Quantity INT
);
INSERT INTO Order_Items VALUES
(1,1,1),(2,1,2),(3,3,1),(4,4,1),(5,5,2),(6,6,1),(7,7,1),(8,8,3),
(9,9,1),(10,10,1),(11,12,2),(12,13,5),(13,14,10),(14,15,4),
(15,16,2),(16,17,1),(17,18,3),(18,1,1),(19,4,2),(20,7,1),
(21,13,3),(22,14,2),(23,3,1),(24,9,2),(25,17,1);
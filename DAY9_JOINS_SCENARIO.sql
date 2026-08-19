create database joins;
use joins;
CREATE TABLE Employee ( Emp_ID INT PRIMARY KEY,
 Emp_Name VARCHAR(30),
 Department_ID INT, Salary DECIMAL(10,2),
 foreign key employee(department_id) references department(department_id)
);
 INSERT INTO Employee VALUES (101,'John',1,45000), 
 (102,'Alice',2,55000),
 (103,'David',3,60000),
 (104,'Ravi',4,50000),
 (105,'Meena',2,40000),
 (106,'Karthik',5,65000),
 (107,'A',1,15000), 
 (108,'B',2,25000),
 (109,'C',3,30000),
 (110,'D',4,40000),
 (111,'E',2,47000),
 (112,'F',5,62000),
 (113,'G',2,57000),
 (114,'H',3,69000),
 (115,'i',4,53000);
 
 CREATE TABLE Department ( Department_ID INT PRIMARY KEY, 
 Department_Name VARCHAR(30) );
 INSERT INTO Department VALUES (1,'Sales'), (2,'HR'),
 (3,'Finance'),
 (4,'IT'), (6,'Marketing'); 
 
 SELECT e.Emp_Name,d. Department_Name, e.Salary
 FROM Employee e
 INNER JOIN Department d
 ON E.Department_ID = D.Department_ID
 order by e.salary desc; 
 
use joins;
 CREATE TABLE customer ( cus_ID INT PRIMARY KEY,
 cus_Name VARCHAR(30),
 city varchar(50));
 INSERT INTO customer VALUES(1,'john','chennai'),
(2,'mary','bangalore'),
(3,'david','hydrabad'),
(4,'sam','combatore'),
(5,'priya','madurai'),
(6,'aaa','a'),
(7,'bbb','b'),
(8,'ccc','c'),
(9,'ddd','d'),
(10,'eee','e'),
(11,'fff','f'),
(12,'ggg','g'),
(13,'hhh','h'),
(14,'sam','i'),
(15,'priya','j');

CREATE TABLE ordertab ( order_id int primary key,cus_ID INT ,
 order_date date,
 order_amt decimal(10,2));
INSERT INTO ordertab VALUES(101,1,'2000-10-01',10000),
(102,2,'2000-10-02',20000),
(103,3,'2000-10-03',30000),
(104,4,'2000-10-04',40000),
(105,5,'2000-10-05',50000),
(106,10,'2000-10-06',60000),
(107,11,'2000-10-07',55000),
(108,13,'2000-10-08',45000),
(109,16,'2000-10-09',35000),
(110,9,'2000-10-11',25000),
(111,7,'2000-10-01',15000),
(112,8,'2000-10-02',10000);
 
SELECT c.cus_id,c.cus_name,c.city,o.order_id
 FROM customer c 
 left JOIN ordertab o
 ON o.cus_ID = c.cus_ID
  where o.order_id is null
 order by c.cus_name asc; 
 
CREATE TABLE Employee1 ( Emp_ID INT PRIMARY KEY,
 Emp_Name VARCHAR(30),
 Department_ID INT, Salary DECIMAL(10,2)
);
 INSERT INTO Employee1 VALUES (101,'John',1,45000), 
 (102,'Alice',2,55000),
 (103,'David',3,60000),
 (104,'Ravi',1,50000),
 (105,'Meena',2,40000),
 (106,'Karthik',6,65000),
 (107,'A',8,15000), 
 (108,'B',9,25000),
 (109,'C',3,30000),
 (110,'D',15,40000),
 (111,'E',12,47000),
 (112,'F',5,62000);
 CREATE TABLE Department1 ( Department_ID INT , 
 Department_Name VARCHAR(30) );
 INSERT INTO Department1 VALUES (1,'Sales'), (2,'HR'),
 (3,'Finance'),
 (4,'IT'), (5,'non-it'),(6,'Marketing'),(7,'electrician'),(8,'teaching');  
 
  
  SELECT b.department_id,b.department_name,a.emp_id,a.emp_name
 FROM  employee1 a
 right JOIN department1 b
 ON b.department_ID = a.department_id
  where a.emp_id is null
 order by b.department_name asc ; 
 
 use joins;
 CREATE TABLE Employee2 ( Emp_ID INT ,
 Emp_Name VARCHAR(30),
 manager_id INT, 
 department varchar(50)
);
 INSERT INTO Employee2 VALUES (101,'John',null,'it'), 
 (102,'Alice',109,'hr'),
 (103,'David',103,'finance'),
 (104,'Ravi',101,'non-it'),
 (105,'Meena',102,'electrician'),
 (106,'Karthik',105,'sales'),
 (107,'A',107,'marketing'), 
 (108,'B',108,'a'),
 (109,'C',113,'it'),
 (110,'D',104,'b'),
 (111,'E',112,'c'),
 (112,'F',115,'d'),
 (113,'G',102,'hr'),
 (114,'H',103,'e'),
 (115,'i',117,'f');
 
 SELECT E.EMP_NAME,M.EMP_Name
FROM Employee2 m
right JOIN Employee2 e
ON e.Manager_ID = m.Emp_ID
where m.emp_id is null
order by e.emp_name asc;

CREATE TABLE pro_mas ( pro_ID INT ,
 pro_Name VARCHAR(30)
);
INSERT INTO Pro_Mas VALUES
(101,'Laptop'),
(102,'Mouse'),
(103,'Keyboard'),
(104,'Monitor'),
(105,'Printer'),
(106,'Scanner'),
(107,'Webcam'),
(108,'Speaker'),
(109,'Router'),
(110,'Hard Disk'),
(111,'SSD'),
(112,'Pendrive'),
(113,'Projector'),
(114,'UPS'),
(115,'Tablet');
CREATE TABLE ware_stock ( pro_ID INT ,
 quantity int
);
INSERT INTO Ware_Stock VALUES
(101,20),
(102,50),
(103,40),
(104,15),
(105,10),
(106,8),
(108,25),
(109,18),
(110,30),
(111,22),
(116,12),
(117,5);
SELECT p.pro_id,p.pro_name,w.quantity
 FROM pro_mas p
 INNER JOIN ware_stock w
 ON p.pro_ID = w.pro_ID
 order by p.pro_id asc;
 
 SELECT p.pro_id,p.pro_name,w.quantity
 FROM pro_mas p
 left JOIN ware_stock w
 ON p.pro_ID = w.pro_ID
 where w.pro_id is null
 order by p.pro_id asc;
 
 SELECT p.pro_id,p.pro_name,w.quantity
 FROM  ware_stock w
 left JOIN pro_mas p
 ON p.pro_ID = w.pro_ID
 where p.pro_id is null
 order by p.pro_id asc;
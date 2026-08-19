CREATE DATABASE sqlproject;
use sqlproject;

create table department( dep_id int primary key,dep_name varchar(100));

INSERT INTO Department VALUES
(1,'HR'),(2,'Finance'),(3,'Sales'),(4,'Marketing'),
(5,'IT'),(6,'Operations'),(7,'Admin'),(8,'Customer Support');

create table employee(
emp_id int, emp_name varchar(50),dep_id int,sal decimal(10,2),
hire_date date,status varchar(20));

INSERT INTO Employee VALUES
(1001,'Arjun',1,82000,'2023-01-16','Active'),(1002,'Priya',1,77500,'2023-04-03','Active'),
(1003,'Rahul',1,70500,'2023-03-25','Active'),(1004,'Sneha',1,68000,'2023-05-02','Active'),
(1005,'Vikram',1,59000,'2023-10-28','Active'),(1006,'Anita',1,53500,'2023-12-04','Inactive'),
(1007,'Karthik',2,104000,'2023-02-20','Active'),(1008,'Divya',2,99000,'2023-03-15','Active'),
(1009,'Sanjay',2,98500,'2023-04-17','Active'),(1010,'Meera',2,70000,'2023-08-09','Active'),
(1011,'Ravi',2,69500,'2023-11-18','Active'),(1012,'Kavya',2,58000,'2023-05-28','Active'),
(1013,'Suresh',3,108500,'2023-05-14','Active'),(1014,'Pooja',3,83500,'2023-12-06','Active'),
(1015,'Manoj',3,77500,'2023-04-15','Active'),(1016,'Deepa',3,74000,'2023-07-01','Active'),
(1017,'Ajay',3,54500,'2023-06-24','Active'),(1018,'Neha',3,54000,'2023-09-24','Active'),
(1019,'Vinay',3,41000,'2023-09-09','Active'),(1020,'Shalini',4,90500,'2023-12-27','Active'),
(1021,'Ramesh',4,82000,'2023-09-21','Inactive'),(1022,'Lakshmi',4,74000,'2023-08-17','Active'),
(1023,'Arun',4,61000,'2023-03-20','Active'),(1024,'Swathi',4,53000,'2023-02-07','Inactive'),
(1025,'Prakash',4,48500,'2023-01-05','Active'),(1026,'Anjali',5,126500,'2023-10-16','Active'),
(1027,'Naveen',5,119000,'2023-08-01','Active'),(1028,'Bhavya',5,117500,'2023-08-04','Active'),
(1029,'Kiran',5,97500,'2023-06-12','Active'),(1030,'Radha',5,91000,'2023-09-27','Inactive'),
(1031,'Gopal',5,70500,'2023-10-26','Inactive'),(1032,'Sunita',5,50000,'2023-04-10','Active'),
(1033,'Harish',6,84500,'2023-01-27','Active'),(1034,'Uma',6,74000,'2023-11-03','Inactive'),
(1035,'Dinesh',6,69000,'2023-02-25','Active'),(1036,'Nisha',6,53000,'2023-04-18','Inactive'),
(1037,'Mahesh',6,43000,'2023-11-25','Inactive'),(1038,'Preeti',6,41500,'2023-08-05','Active'),
(1039,'Ashok',7,65000,'2023-10-18','Active'),(1040,'Geetha',7,62000,'2023-12-25','Active'),
(1041,'Vijay',7,51500,'2023-02-24','Active'),(1042,'Rekha',7,48500,'2023-11-23','Active'),
(1043,'Sathish',7,45500,'2023-09-07','Active'),(1044,'Latha',7,43000,'2023-11-23','Active'),
(1045,'Girish',8,74500,'2023-12-17','Active'),(1046,'Padma',8,73500,'2023-05-15','Active'),
(1047,'Mohan',8,60000,'2023-06-04','Active'),(1048,'Sudha',8,57500,'2023-06-08','Active'),
(1049,'Raj',8,55500,'2023-01-08','Active'),(1050,'Indira',8,51500,'2023-07-03','Active');

-- 1st /output  
select d.dep_name,count(e.emp_id) as total_emp,
avg(e.sal) as avg_sal,max(e.sal) as high_sal,min(e.sal) as low_sal
from employee e 
inner join department d
on e.dep_id=d.dep_id
group by d.dep_name
order by avg_sal desc;

-- 2nd /output
select d.dep_name,sum(e.sal) as total_sal
from department d
inner join employee e
on d.dep_id=e.dep_id
group by d.dep_name
having sum(e.sal)>(select avg(dep_total) from (select sum(sal)
 as dep_total from employee 
 group by dep_id) total)
order by total_sal desc;

-- 3rd /output
select e.emp_name,d.dep_name,e.sal,avg(sal)  as avg_sal
from employee e
join department d
on e.dep_id=d.dep_id
where sal>(select avg(sal) from employee 
where dep_id=d.dep_id
group by d.dep_name)
group by e.emp_name,d.dep_name,e.sal;

-- 4th /output
select d.dep_name,sum(e.sal) as total_sal,rank() over(
order by sum(e.sal) desc) as rank_no from employee e
join department d
on e.dep_id=d.dep_id
group by d.dep_name
order by total_sal desc;

create table emp_stage(load_id int,emp_id int,
emp_name varchar(100),dep_id int,sal decimal(10,2),
load_date date);

INSERT INTO Emp_Stage  VALUES
(1,2001,'Ravi',3,86750,'2024-11-02'),(2,2002,'Rahul',2,82931,'2024-10-02'),
(3,2003,'Radha',4,39914,'2024-02-14'),(4,2004,'Pooja',2,66544,'2024-02-18'),
(5,2005,'Pooja',1,109115,'2024-02-08'),(6,2006,'Ramesh',1,110642,'2024-10-13'),
(7,2007,'Priya',4,41105,'2024-09-28'),(8,2008,'Vikram',5,89937,'2024-03-18'),
(9,2009,'Sneha',5,108434,'2024-11-06'),(10,2010,'Sneha',4,83810,'2024-02-18'),
(11,2011,'Arun',2,108972,'2024-01-20'),(12,2012,'Karthik',8,104693,'2024-07-25'),
(13,2013,'Ravi',8,111750,'2024-08-12'),(14,2014,'Meera',4,58562,'2024-12-25'),
(15,2015,'Divya',2,110290,'2024-05-17'),(16,2016,'Deepa',6,93829,'2024-05-20'),
(17,2017,'Rahul',2,102100,'2024-07-06'),(18,2018,'Prakash',6,54920,'2024-08-14'),
(19,2019,'Priya',2,108148,'2024-10-26'),(20,2020,'Kiran',6,79580,'2024-12-12'),
(21,2021,'Shalini',8,111008,'2024-08-03'),(22,2022,'Naveen',2,70381,'2024-08-23'),
(23,2023,'Lakshmi',2,42952,'2024-12-23'),(24,2024,'Meera',8,72302,'2024-12-13'),
(25,2025,'Kiran',6,37957,'2024-08-12'),(26,2026,'Anita',2,99709,'2024-01-07'),
(27,2027,'Prakash',5,51952,'2024-12-08'),(28,2028,'Suresh',7,100078,'2024-02-06'),
(29,2029,'Manoj',7,107016,'2024-05-05'),(30,2030,'Naveen',7,107118,'2024-05-23'),
(31,2031,'Pooja',6,84865,'2024-04-05'),(32,2032,'Rahul',3,54830,'2024-04-22'),
(33,2033,'Divya',1,98565,'2024-10-06'),(34,2034,'Sanjay',5,35536,'2024-03-14'),
(35,2035,'Neha',6,114929,'2024-10-11'),(36,2036,'Vikram',1,94853,'2024-11-26'),
(37,2037,'Neha',7,87175,'2024-07-13'),(38,2038,'Sneha',8,118137,'2024-07-02'),
(39,2039,'Karthik',2,62363,'2024-08-06'),(40,2040,'Sneha',6,113738,'2024-01-04'),
(41,2041,'Arjun',3,105335,'2024-02-12'),(42,2042,'Shalini',1,44216,'2024-04-20'),
(43,2043,'Suresh',3,118153,'2024-05-12'),(44,2044,'Shalini',6,97147,'2024-02-04'),
(45,2045,'Bhavya',8,96078,'2024-08-16'),(46,2046,'Meera',2,53889,'2024-02-24'),
(47,2047,'Ravi',5,97733,'2024-12-06'),(48,2048,'Ajay',1,61897,'2024-09-12'),
(49,2049,'Vikram',1,104220,'2024-05-21'),(50,2050,'Bhavya',2,69224,'2024-09-12'),
(51,2051,'Radha',3,81621,'2024-04-18'),(52,2052,'Neha',6,118419,'2024-04-20'),
(53,2053,'Anjali',4,66377,'2024-07-24'),(54,2054,'Anjali',4,61203,'2024-09-16'),
(55,2055,'Kavya',1,38661,'2024-05-16'),(56,2005,'Sanjay',4,114316,'2024-06-15'),
(57,2012,'Anjali',6,82793,'2024-02-08'),(58,2020,'Sneha',4,96614,'2024-04-11'),
(59,2033,'Karthik',8,116797,'2024-10-27'),(60,2044,'Arjun',8,80089,'2024-11-03');

-- 5th /output
select emp_id,count(*) as duplicate_id
from emp_stage
group by emp_id 
having count(*)>1;

-- 6th
CREATE TABLE Employee_Ext (Emp_ID INT PRIMARY KEY,Emp_Name VARCHAR(100),
Dep_ID INT,Sal DECIMAL(10,2),Hire_Date DATE,Status VARCHAR(20));

INSERT INTO Employee_Ext VALUES
(3001,'Naveen',2,85926,'2024-12-25','Active'),(3002,'Deepa',3,91875,'2024-11-11','Active'),
(3003,'Anjali',7,95707,'2024-07-24','Active'),(3004,'Swathi',3,57282,'2024-03-01','Active'),
(3005,'Vinay',8,120964,'2024-03-20','Inactive'),(3006,'Lakshmi',6,55435,'2024-09-18','Active'),
(3007,'Arjun',1,139773,'2024-12-21','Active'),(3008,'Ajay',3,91860,'2024-04-27','Active'),
(3009,'Arjun',5,62889,'2024-05-17','Active'),(3010,'Prakash',6,68995,'2024-09-14','Active'),
(3011,'Priya',6,95052,'2024-11-19','Inactive'),(3012,'Naveen',3,104707,'2024-03-17','Active'),
(3013,'Bhavya',8,136778,'2024-03-20','Active'),(3014,'Prakash',3,57589,'2024-03-16','Active'),
(3015,'Neha',1,77727,'2024-11-17','Inactive'),(3016,'Anjali',2,108439,'2024-01-08','Active'),
(3017,'Sanjay',1,136221,'2024-02-17','Inactive'),(3018,'Neha',1,134613,'2024-02-15','Active'),
(3019,'Shalini',4,125797,'2024-05-15','Inactive'),(3020,'Ajay',4,126647,'2024-09-09','Active'),
(3021,'Naveen',8,52974,'2024-07-04','Inactive'),(3022,'Manoj',6,44508,'2024-11-08','Inactive'),
(3023,'Rahul',4,122749,'2024-05-26','Active'),(3024,'Kiran',3,128863,'2024-11-22','Active'),
(3025,'Vikram',5,52990,'2024-08-08','Active'),(3026,'Suresh',8,56337,'2024-11-27','Active'),
(3027,'Anita',7,102581,'2024-07-11','Inactive'),(3028,'Karthik',6,76749,'2024-02-24','Active'),
(3029,'Arjun',6,107620,'2024-08-15','Active'),(3030,'Suresh',6,102821,'2024-10-10','Active'),
(3031,'Sneha',4,48733,'2024-02-09','Active'),(3032,'Priya',3,70447,'2024-03-27','Inactive'),
(3033,'Bhavya',5,88208,'2024-03-18','Inactive'),(3034,'Arun',6,46725,'2024-05-02','Active'),
(3035,'Pooja',2,70248,'2024-01-21','Active'),(3036,'Anjali',5,45976,'2024-10-28','Active'),
(3037,'Rahul',5,50948,'2024-08-01','Active'),(3038,'Neha',7,70108,'2024-10-05','Active'),
(3039,'Ajay',4,49346,'2024-03-09','Active'),(3040,'Anita',4,75893,'2024-11-10','Active'),
(3041,'Meera',8,100547,'2024-11-06','Active'),(3042,'Kavya',1,67826,'2024-01-01','Active'),
(3043,'Swathi',4,102401,'2024-08-08','Inactive'),(3044,'Sneha',7,121050,'2024-08-18','Inactive'),
(3045,'Ajay',5,125143,'2024-04-08','Active'),(3046,'Karthik',3,88044,'2024-06-02','Active'),
(3047,'Arjun',2,116978,'2024-12-09','Inactive'),(3048,'Anita',1,46073,'2024-11-27','Inactive'),
(3049,'Bhavya',5,113483,'2024-04-23','Active'),(3050,'Priya',8,59294,'2024-03-09','Inactive'),
(3051,'Arjun',50,69503,'2024-06-11','Active'),(3052,'Neha',60,77406,'2024-04-02','Active'),
(3053,'Kiran',70,75573,'2024-04-12','Active'),(3054,'Anita',80,35140,'2024-06-13','Active'),
(3055,'Rahul',90,97212,'2024-05-17','Active');

-- output
select ex.emp_id,ex.emp_name,ex.dep_id 
from employee_ext ex
left join department d 
on ex.dep_id=d.dep_id
where d.dep_id is null;

create table emp_history(emp_id int,
emp_name varchar(100),dep_id int,sal decimal,
effective_date date);

INSERT INTO Emp_History  VALUES
(4001,'Ramesh',4,51264,'2022-01-15'),(4001,'Ramesh',4,57398,'2023-01-15'),
(4001,'Ramesh',2,60142,'2024-01-15'),(4002,'Vikram',7,73456,'2022-01-15'),
(4002,'Vikram',7,75797,'2023-01-15'),(4002,'Vikram',7,80251,'2024-01-15'),
(4003,'Divya',2,73376,'2022-01-15'),(4003,'Divya',2,79711,'2023-01-15'),
(4003,'Divya',2,82982,'2024-01-15'),(4004,'Arun',7,85089,'2022-01-15'),
(4004,'Arun',7,89760,'2023-01-15'),(4004,'Arun',3,95808,'2024-01-15'),
(4005,'Priya',7,83093,'2022-01-15'),(4005,'Priya',7,90836,'2023-01-15'),
(4005,'Priya',7,93977,'2024-01-15'),(4006,'Prakash',1,89159,'2022-01-15'),
(4006,'Prakash',1,96782,'2023-01-15'),(4006,'Prakash',1,104608,'2024-01-15'),
(4007,'Arun',4,40576,'2022-01-15'),(4007,'Arun',6,42831,'2023-01-15'),
(4007,'Arun',6,45690,'2024-01-15'),(4008,'Manoj',1,76141,'2022-01-15'),
(4008,'Manoj',1,78295,'2023-01-15'),(4008,'Manoj',5,85871,'2024-01-15'),
(4009,'Arjun',8,87277,'2022-01-15'),(4009,'Arjun',8,89851,'2023-01-15'),
(4009,'Arjun',8,95971,'2024-01-15'),(4010,'Rahul',2,83872,'2022-01-15'),
(4010,'Rahul',2,89753,'2023-01-15'),(4010,'Rahul',4,93928,'2024-01-15'),
(4011,'Divya',8,67371,'2022-01-15'),(4011,'Divya',5,72504,'2023-01-15'),
(4011,'Divya',5,74886,'2024-01-15'),(4012,'Ramesh',4,40077,'2022-01-15'),
(4012,'Ramesh',5,46989,'2023-01-15'),(4012,'Ramesh',5,54326,'2024-01-15'),
(4013,'Meera',3,35817,'2022-01-15'),(4013,'Meera',5,41768,'2023-01-15'),
(4013,'Meera',4,49273,'2024-01-15'),(4014,'Lakshmi',8,54061,'2022-01-15'),
(4014,'Lakshmi',8,61868,'2023-01-15'),(4014,'Lakshmi',8,67674,'2024-01-15'),
(4015,'Prakash',2,70984,'2022-01-15'),(4015,'Prakash',2,74616,'2023-01-15'),
(4015,'Prakash',2,77319,'2024-01-15'),(4016,'Arjun',5,65079,'2022-01-15'),
(4016,'Arjun',5,67705,'2023-01-15'),(4016,'Arjun',5,73386,'2024-01-15'),
(4017,'Suresh',4,48809,'2022-01-15'),(4017,'Suresh',4,51420,'2023-01-15'),
(4017,'Suresh',4,54581,'2024-01-15'),(4018,'Sanjay',6,43690,'2022-01-15'),
(4018,'Sanjay',6,50632,'2023-01-15'),(4018,'Sanjay',2,56799,'2024-01-15'),
(4019,'Arun',6,50163,'2022-01-15'),(4019,'Arun',6,56241,'2023-01-15'),
(4019,'Arun',6,62223,'2024-01-15'),(4020,'Anita',1,67223,'2022-01-15'),
(4020,'Anita',1,74806,'2023-01-15'),(4020,'Anita',1,79279,'2024-01-15'),
(4021,'Pooja',6,59648,'2022-01-15'),(4021,'Pooja',6,64237,'2023-01-15'),
(4021,'Pooja',6,66251,'2024-01-15'),(4022,'Ravi',7,42867,'2022-01-15'),
(4022,'Ravi',7,46470,'2023-01-15'),(4022,'Ravi',2,50844,'2024-01-15'),
(4023,'Suresh',7,73612,'2022-01-15'),(4023,'Suresh',7,76237,'2023-01-15'),
(4023,'Suresh',7,81743,'2024-01-15'),(4024,'Bhavya',1,53391,'2022-01-15'),
(4024,'Bhavya',5,56224,'2023-01-15'),(4024,'Bhavya',5,63425,'2024-01-15'),
(4025,'Divya',5,63589,'2022-01-15'),(4025,'Divya',5,69774,'2023-01-15'),
(4025,'Divya',5,74832,'2024-01-15');

-- 7th /output
select distinct emp_id,effective_date,
row_number() over(partition by emp_id
order by effective_date desc ) as row_no 
from emp_history
group by emp_id,effective_date
having count(distinct emp_id)=1 and effective_date='2024-01-15';

-- 8th /output
select month(hire_date),count(*),
sum(count(*)) over(order by month(hire_date) ) as sum_no
from employee
group by month(hire_date);

-- 9th /output
with topdep as(
select d.dep_name,e.sal,
row_number() over(partition by d.dep_name order by e.sal desc) as row_no,
dense_rank() over(partition by d.dep_name order by e.sal desc)as result
from employee e inner join department d
on e.dep_id=d.dep_id
group by  d.dep_name,e.sal)
select dep_name,sal,row_no,result
from topdep
where row_no<=3;

-- 10th /output
create view empdetails as 
select e.emp_id,e.emp_name,d.dep_name,e.sal,
e.hire_date,e.status from employee e
inner join department d
on e.dep_id=d.dep_id
where e.status='active';

select * from empdetails;

-- model-2
create table customer(
cus_id int primary key ,cus_name varchar(100),
gender varchar(20),city varchar(100),
region varchar(50),join_date date);

INSERT INTO Customer VALUES
(1,'Rakesh Joshi','Male','Delhi','North','2025-08-18'),
(2,'Fatima Reddy','Female','Delhi','North','2024-02-18'),
(3,'Vivek Bansal','Male','Lucknow','North','2025-10-28'),
(4,'Meenal Pandey','Female','Lucknow','North','2025-04-23'),
(5,'Sameer Nair','Male','Delhi','North','2023-11-08'),
(6,'Aarti Mehta','Female','Lucknow','North','2023-04-28'),
(7,'Naveen Ali','Male','Delhi','North','2024-05-15'),
(8,'Bhavna Khan','Female','Lucknow','North','2023-06-12'),
(9,'Kunal Shah','Male','Chandigarh','North','2025-05-23'),
(10,'Ishita Menon','Female','Delhi','North','2025-11-06'),
(11,'Pranav Rao','Male','Bangalore','South','2023-08-13'),
(12,'Ritu Kapoor','Female','Hyderabad','South','2025-12-18'),
(13,'Ajay Pillai','Male','Bangalore','South','2025-06-27'),
(14,'Sunita Chauhan','Female','Chennai','South','2023-01-26'),
(15,'Deepak Ghosh','Male','Hyderabad','South','2024-05-03'),
(16,'Rohit Sinha','Female','Bangalore','South','2025-12-11'),
(17,'Priya Malhotra','Male','Bangalore','South','2025-08-13'),
(18,'Arjun Nanda','Female','Kochi','South','2023-05-05'),
(19,'Sneha Verma','Male','Bangalore','South','2025-09-18'),
(20,'Manoj Iyer','Female','Hyderabad','South','2025-10-14'),
(21,'Kavya Joshi','Male','Guwahati','East','2024-04-05'),
(22,'Rohan Reddy','Female','Guwahati','East','2023-01-28'),
(23,'Divya Bansal','Male','Kolkata','East','2023-11-06'),
(24,'Nikhil Pandey','Female','Guwahati','East','2025-02-13'),
(25,'Pooja Nair','Male','Guwahati','East','2025-08-17'),
(26,'Suresh Mehta','Female','Patna','East','2025-01-22'),
(27,'Tanvi Ali','Male','Kolkata','East','2025-09-25'),
(28,'Yusuf Khan','Female','Patna','East','2025-06-04'),
(29,'Ritika Shah','Male','Patna','East','2024-03-15'),
(30,'Harish Menon','Female','Kolkata','East','2025-12-09'),
(31,'Lavanya Rao','Male','Pune','West','2025-02-28'),
(32,'Omkar Kapoor','Female','Ahmedabad','West','2025-09-20'),
(33,'Zara Pillai','Male','Pune','West','2023-06-25'),
(34,'Ananya Chauhan','Female','Pune','West','2025-09-01'),
(35,'Rahul Ghosh','Male','Ahmedabad','West','2024-01-04'),
(36,'Kiran Sinha','Female','Ahmedabad','West','2024-04-02'),
(37,'Neha Malhotra','Male','Pune','West','2025-02-03'),
(38,'Sanjay Nanda','Female','Surat','West','2023-09-25'),
(39,'Anjali Verma','Male','Pune','West','2023-11-16'),
(40,'Karthik Iyer','Female','Pune','West','2024-09-28');

create table category(cat_id int,cat_name varchar(100));

INSERT INTO Category VALUES(1,'Electronics'),(2,'Clothing'),
(3,'Grocery'),(4,'Furniture'),(5,'Sports'),(6,'Beauty');

create table product(pro_id int,pro_name varchar(150),
cat_id int,unit_price decimal(10,2));

INSERT INTO Product VALUES
(1,'Smartphone X',1,39086.75),(2,'Laptop Pro',1,3450.62),
(3,'Wireless Earbuds',1,17951.7),(4,'Smartwatch',1,14946.22),
(5,'4K TV 55"',1,44715.33),(6,'Men Cotton Shirt',2,2465.44),
(7,'Women Kurti',2,3154.97),(8,'Denim Jeans',2,578.2),
(9,'Winter Jacket',2,1650.15),(10,'Running Shorts',2,395.35),
(11,'Basmati Rice 5kg',3,228.03),(12,'Cooking Oil 1L',3,474.61),
(13,'Sugar 1kg',3,62.82),(14,'Green Tea Pack',3,211.0),
(15,'Almonds 500g',3,598.9),(16,'Office Chair',4,19755.54),
(17,'Wooden Bookshelf',4,8884.76),(18,'Study Table',4,21240.4),
(19,'Sofa Set 3-Seater',4,28615.92),(20,'Bed Frame Queen',4,1717.71),
(21,'Yoga Mat',5,6543.64),(22,'Cricket Bat',5,5736.05),
(23,'Football',5,3051.88),(24,'Dumbbell Set 10kg',5,1666.1),
(25,'Badminton Racket',5,7679.1),(26,'Face Moisturizer',6,941.0),
(27,'Herbal Shampoo',6,367.95),(28,'Lipstick Set',6,377.28),
(29,'Perfume 100ml',6,2141.61),(30,'Sunscreen SPF50',6,1568.76);
  
create table sales(sale_id int,cus_id int,pro_id int,
sale_date date,quantity int,total_amt decimal(10,2));

INSERT INTO Sales VALUES
(1,21,6,'2026-03-01',4,9861.76),(2,4,4,'2026-03-01',5,74731.1),
(3,7,14,'2026-03-02',5,1055.0),(4,4,20,'2026-03-02',2,3435.42),
(5,3,4,'2026-03-03',4,59784.88),(6,27,4,'2026-03-03',2,29892.44),
(7,6,22,'2026-03-04',4,22944.2),(8,4,23,'2026-03-04',1,3051.88),
(9,15,25,'2026-03-05',5,38395.5),(10,4,23,'2026-03-05',5,15259.4),
(11,26,2,'2026-03-06',2,6901.24),(12,3,22,'2026-03-06',2,11472.1),
(13,19,17,'2026-03-07',2,17769.52),(14,35,5,'2026-03-07',5,223576.65),
(15,20,22,'2026-03-08',2,11472.1),(16,7,23,'2026-03-08',5,15259.4),
(17,13,14,'2026-03-09',1,211.0),(18,36,28,'2026-03-09',1,377.28),
(19,37,2,'2026-03-10',5,17253.1),(20,14,19,'2026-03-10',5,143079.6),
(21,28,30,'2026-03-11',3,4706.28),(22,30,23,'2026-03-11',4,12207.52),
(23,24,12,'2026-03-12',2,949.22),(24,12,28,'2026-03-12',2,754.56),
(25,6,23,'2026-03-13',3,9155.64),(26,34,19,'2026-03-13',3,85847.76),
(27,29,12,'2026-03-14',5,2373.05),(28,5,5,'2026-03-14',5,223576.65),
(29,27,7,'2026-03-15',3,9464.91),(30,10,19,'2026-03-15',4,114463.68),
(31,3,26,'2026-03-16',1,941.0),(32,36,23,'2026-03-16',3,9155.64),
(33,22,28,'2026-03-17',3,1131.84),(34,39,19,'2026-03-17',5,143079.6),
(35,30,4,'2026-03-18',1,14946.22),(36,18,19,'2026-03-18',1,28615.92),
(37,4,29,'2026-03-19',3,6424.83),(38,37,26,'2026-03-19',4,3764.0),
(39,19,28,'2026-03-20',4,1509.12),(40,23,1,'2026-03-20',4,156347.0),
(41,23,7,'2026-03-21',5,15774.85),(42,8,19,'2026-03-21',1,28615.92),
(43,14,30,'2026-03-22',3,4706.28),(44,9,29,'2026-03-22',2,4283.22),
(45,26,16,'2026-03-23',4,79022.16),(46,6,7,'2026-03-23',4,12619.88),
(47,26,22,'2026-03-24',3,17208.15),(48,9,17,'2026-03-24',5,44423.8),
(49,18,28,'2026-03-25',4,1509.12),(50,23,26,'2026-03-25',4,3764.0),
(51,15,6,'2026-03-26',1,2465.44),(52,12,6,'2026-03-26',2,4930.88),
(53,15,1,'2026-03-27',4,156347.0),(54,38,7,'2026-03-27',3,9464.91),
(55,19,1,'2026-03-28',2,78173.5),(56,27,22,'2026-03-28',3,17208.15),
(57,40,23,'2026-03-29',3,9155.64),(58,9,28,'2026-03-29',5,1886.4),
(59,40,25,'2026-03-30',1,7679.1),(60,30,30,'2026-03-30',5,7843.8),
(61,26,16,'2026-03-31',4,79022.16),(62,26,5,'2026-03-31',4,178861.32),
(63,29,24,'2026-01-18',1,1666.1),(64,40,16,'2026-01-03',2,39511.08),
(65,29,24,'2026-01-21',3,4998.3),(66,19,19,'2026-01-16',4,114463.68),
(67,4,6,'2026-01-16',1,2465.44),(68,14,19,'2026-01-24',6,171695.52),
(69,5,20,'2026-01-06',3,5153.13),(70,2,30,'2026-01-05',5,7843.8),
(71,6,28,'2026-01-10',3,1131.84),(72,13,14,'2026-01-17',2,422.0),
(73,22,13,'2026-01-18',6,376.92),(74,13,10,'2026-01-08',4,1581.4),
(75,13,20,'2026-01-24',4,6870.84),(76,2,11,'2026-02-12',4,912.12),
(77,20,14,'2026-02-09',4,844.0),(78,23,14,'2026-02-26',1,211.0),
(79,8,8,'2026-02-08',3,1734.6),(80,37,24,'2026-02-07',1,1666.1),
(81,23,25,'2026-02-16',1,7679.1),(82,25,28,'2026-02-27',2,754.56),
(83,28,25,'2026-02-16',3,23037.3),(84,26,18,'2026-02-03',4,84961.6),
(85,11,7,'2026-02-24',2,6309.94),(86,37,18,'2026-02-01',6,127442.4),
(87,39,19,'2026-02-05',6,171695.52),(88,22,6,'2026-02-12',1,2465.44),
(89,7,20,'2026-04-01',6,10306.26),(90,19,8,'2026-04-30',2,1156.4),
(91,14,20,'2026-04-01',2,3435.42),(92,17,22,'2026-04-25',4,22944.2),
(93,37,29,'2026-04-27',3,6424.83),(94,20,20,'2026-04-29',4,6870.84),
(95,33,6,'2026-04-27',5,12327.2),(96,26,18,'2026-04-05',2,42480.8),
(97,1,6,'2026-04-20',2,4930.88),(98,39,5,'2026-04-05',5,223576.65),
(99,22,20,'2026-04-02',5,8588.55),(100,7,22,'2026-04-16',1,5736.05),
(101,26,30,'2026-04-08',1,1568.76),(102,26,30,'2026-05-17',1,1568.76),
(103,22,24,'2026-05-15',5,8330.5),(104,29,20,'2026-05-07',5,8588.55),
(105,5,28,'2026-05-26',5,1886.4),(106,17,22,'2026-05-29',2,11472.1),
(107,11,5,'2026-05-27',4,178861.32),(108,2,10,'2026-05-15',4,1581.4),
(109,14,5,'2026-05-03',2,89430.66),(110,24,6,'2026-05-31',3,7396.32),
(111,8,10,'2026-05-29',6,2372.1),(112,37,19,'2026-05-31',2,57231.84),
(113,11,28,'2026-05-22',4,1509.12),(114,11,8,'2026-05-17',3,1734.6),
(115,29,1,'2026-06-11',3,117260.25),(116,39,1,'2026-06-18',4,156347.0),
(117,14,20,'2026-06-11',1,1717.71),(118,15,5,'2026-06-04',1,44715.33),
(119,37,30,'2026-06-09',2,3137.52),(120,28,26,'2026-06-09',3,2823.0),
(121,37,20,'2026-06-13',5,8588.55),(122,6,11,'2026-06-16',1,228.03),
(123,28,4,'2026-06-26',3,44838.66),(124,17,4,'2026-06-01',5,74731.1),
(125,14,5,'2026-06-28',4,178861.32),(126,22,17,'2026-06-01',3,26654.28),
(127,22,28,'2026-06-20',2,754.56),(128,13,11,'2026-07-31',1,228.03),
(129,14,25,'2026-07-06',3,23037.3),(130,19,18,'2026-07-17',5,106202.0),
(131,29,1,'2026-07-22',3,117260.25),(132,39,20,'2026-07-02',5,8588.55),
(133,5,18,'2026-07-07',1,21240.4),(134,28,26,'2026-07-22',4,3764.0),
(135,26,20,'2026-07-18',3,5153.13),(136,5,13,'2026-07-23',2,125.64),
(137,9,16,'2026-07-27',3,59266.62),(138,1,4,'2026-07-02',6,89677.32),
(139,28,7,'2026-07-24',1,3154.97),(140,25,20,'2026-07-03',6,10306.26),
(141,19,2,'2026-08-10',4,13802.48),(142,8,1,'2026-08-06',3,117260.25),
(143,36,13,'2026-08-12',2,125.64),(144,20,8,'2026-08-02',3,1734.6),
(145,11,4,'2026-08-06',4,59784.88),(146,5,10,'2026-08-09',5,1976.75),
(147,14,4,'2026-08-25',2,29892.44),(148,26,1,'2026-08-13',3,117260.25),
(149,6,23,'2026-08-10',5,15259.4),(150,39,16,'2026-08-28',3,59266.62),
(151,10,12,'2026-08-24',6,2847.66),(152,3,28,'2026-08-20',5,1886.4),
(153,39,20,'2026-09-21',2,3435.42),(154,22,23,'2026-09-30',1,3051.88),
(155,15,4,'2026-09-27',1,14946.22),(156,29,5,'2026-09-02',4,178861.32),
(157,26,25,'2026-09-27',1,7679.1),(158,5,19,'2026-09-21',3,85847.76),
(159,4,29,'2026-09-01',5,10708.05),(160,2,20,'2026-09-29',1,1717.71),
(161,17,4,'2026-09-24',3,44838.66),(162,14,10,'2026-09-08',6,2372.1),
(163,32,16,'2026-09-21',1,19755.54),(164,19,30,'2026-09-16',1,1568.76),
(165,13,4,'2026-10-20',5,74731.1),(166,2,29,'2026-10-05',6,12849.66),
(167,9,1,'2026-10-10',4,156347.0),(168,2,5,'2026-10-02',6,268291.98),
(169,19,28,'2026-10-07',5,1886.4),(170,8,30,'2026-10-10',1,1568.76),
(171,14,4,'2026-10-29',4,59784.88),(172,4,20,'2026-10-01',4,6870.84),
(173,37,8,'2026-10-09',1,578.2),(174,39,20,'2026-10-19',3,5153.13),
(175,20,25,'2026-10-31',5,38395.5),(176,24,10,'2026-10-09',4,1581.4),
(177,26,1,'2026-11-29',2,78173.5),(178,29,16,'2026-11-01',3,59266.62),
(179,29,16,'2026-11-24',3,59266.62),(180,1,13,'2026-11-04',3,188.46),
(181,37,8,'2026-11-27',6,3469.2),(182,19,11,'2026-11-01',3,684.09),
(183,19,23,'2026-11-03',1,3051.88),(184,18,2,'2026-11-12',3,10351.86),
(185,2,12,'2026-11-04',6,2847.66),(186,14,17,'2026-11-30',5,44423.8),
(187,29,17,'2026-11-11',1,8884.76),(188,26,22,'2026-11-26',5,28680.25),
(189,4,29,'2026-12-07',4,8566.44),(190,9,25,'2026-12-15',3,23037.3),
(191,37,22,'2026-12-16',2,11472.1),(192,29,12,'2026-12-06',3,1423.83),
(193,17,16,'2026-12-09',6,118533.24),(194,22,26,'2026-12-08',4,3764.0),
(195,13,4,'2026-12-04',2,29892.44),(196,32,22,'2026-12-17',2,11472.1),
(197,29,17,'2026-12-15',2,17769.52),(198,4,7,'2026-12-18',3,9464.91),
(199,5,14,'2026-12-18',3,633.0),(200,2,29,'2026-12-26',4,8566.44);

-- 11th /output
select year(sale_date),month(sale_date),
sum(total_amt) from sales
group by year(sale_date),month(sale_date)
order by year(sale_date),month(sale_date);

-- 12th
select p.pro_name,sum(p.unit_price),p.unit_price*0.8 as result
from product p 
group by p.pro_name,p.unit_price*0.8
order by p.unit_price*0.8 desc;

-- 13th /output
select p.pro_id,p.pro_name,ca.cat_name
from category ca
inner join product p
on ca.cat_id=p.cat_id
left join sales s
on p.pro_id=s.pro_id
where s.sale_id is null;

-- 14th /output
select cu.cus_name,count(cat_name)
from customer cu
 join sales s
 on cu.cus_id=s.cus_id
 join product p
on s.pro_id=p.pro_id
join category ca
on p.cat_id=ca.cat_id
group by cu.cus_name
having count(cat_name)>1
order by count(cat_name);

-- 15th /output
with highsell as(
select ca.cat_name,p.pro_name,sum(s.quantity) as sum1,
dense_rank() over(partition by ca.cat_name
 order by sum(s.quantity) desc)  as result
from category ca
join product p
on ca.cat_id=p.cat_id
 join sales s
 on p.pro_id=s.pro_id
 group by ca.cat_name,p.pro_name)
 select cat_name,pro_name,sum1,result
 from highsell
 where result=2;

-- 16th /output
select cu.cus_name,count(sale_id),sum(total_amt),
sum(total_amt) as lifetime_value
from customer cu
 join sales s 
on cu.cus_id=s.cus_id
group by cu.cus_name
order by lifetime_value desc; 

-- 17th /output
select sale_date,sum(total_amt),
lag(total_amt) over( order by sale_date) as previous_revenue,
lead(total_amt) over( order by sale_date) as next_revenue
from sales
group by sale_date;

-- 18th /output
with topcustomer as(
select cu.region,cu.cus_name,sum(s.total_amt) as res,
dense_rank() over(partition by cu.region 
order by sum(s.total_amt) desc) as rnk_no
from customer cu
join sales s
on cu.cus_id=s.cus_id
group by cu.region,cu.cus_name)
select region,cus_name,res,rnk_no
from topcustomer
where rnk_no<=5;

-- 19th /output
create view mon_sales as
select year(sale_date),month(sale_date),count(sale_id),sum(total_amt),
sum(quantity) from sales
group by year(sale_date),month(sale_date);

select * from mon_sales;

-- 20th /output
with regional_sales as
(select cu.region,
count(cu.cus_id) as Total_customers,
count(s.sale_id) as Total_orders,
sum(s.total_amt) as Total_revenue
from customer cu
inner join sales s
on cu.cus_id = s.cus_id
group by cu.region
)
select region,Total_customers,Total_orders,Total_revenue,
round(Total_customers / Total_revenue ) as Average_Revenue_per_Customer
FROM regional_sales
ORDER BY Total_revenue DESC;

-- model-3
create table batch_master( bat_id int primary key,bat_name varchar(100),
batch_date date,load_status varchar(20));

INSERT INTO Batch_Master VALUES(1,'Customer_Batch_Load_01','2026-06-25','Success'),
(2,'Customer_Batch_Load_02','2026-06-26','Success'),(3,'Customer_Batch_Load_03','2026-06-27','Partial'),
(4,'Customer_Batch_Load_04','2026-06-28','Partial'),(5,'Customer_Batch_Load_05','2026-06-29','Failed');

create table source_customer( cus_id int primary key,cus_name varchar(100),
email varchar(100),phone varchar(20),city varchar(100),bat_id int);

INSERT INTO Source_Customer VALUES
(1,'Rakesh Iyer','rakesh.iyer@mail.com','9876500001','Chennai',1),
(2,'Fatima Ali','fatima.ali@mail.com','9876500002','Delhi',1),
(3,'Vivek Chauhan','vivek.chauhan@mail.com','9876500003','Mumbai',1),
(4,'Meenal Joshi','meenal.joshi@mail.com','9876500004','Pune',1),
(5,'Sameer Khan','sameer.khan@mail.com','9876500005','Delhi',1),
(6,'Aarti Ghosh','aarti.ghosh@mail.com','9876500006','Kolkata',1),
(7,'Naveen Reddy','naveen.reddy@mail.com','9876500007','Hyderabad',2),
(8,'Bhavna Shah','bhavna.shah@mail.com','9876500008','Ahmedabad',2),
(9,'Kunal Sinha','kunal.sinha@mail.com','9876500009','Patna',2),
(10,'Ishita Bansal','ishita.bansal@mail.com','9876500010','Jaipur',2),
(11,'Pranav Menon','pranav.menon@mail.com','9876500011','Kochi',2),
(12,'Ritu Malhotra','ritu.malhotra@mail.com','9876500012','Chandigarh',2),
(13,'Ajay Pandey','ajay.pandey@mail.com','9876500013','Lucknow',3),
(14,'Sunita Rao','sunita.rao@mail.com','9876500014','Bengaluru',3),
(15,'Deepak Nanda','deepak.nanda@mail.com','9876500015','Bhubaneswar',3),
(16,'Ananya Rao','ananya.rao@mail.com','9876500016','Chennai',3),
(17,'Rahul Mehta','rahul.mehta@mail.com','9876500017','Mumbai',3),
(18,'Priya Nair','priya.nair@mail.com','9876500018','Kochi',3),
(19,'Kiran Shah','kiran.shah@mail.com','9876500019','Surat',4),
(20,'Arjun Verma','arjun.verma@mail.com','9876500020','Delhi',4),
(21,'Sneha Kapoor','sneha.kapoor@mail.com','9876500021','Pune',4),
(22,'Manoj Pillai','manoj.pillai@mail.com','9876500022','Chennai',4),
(23,'Divya Menon','divya.menon@mail.com','9876500023','Kochi',4),
(24,'Rohit Nair','rohit.nair@mail.com','9876500024','Bengaluru',4),
(25,'Sanjay Kumar','sanjay.kumar@mail.com','9876500025','Guwahati',5),
(26,'Neha Joshi','neha.joshi@mail.com','9876500026','Jaipur',5),
(27,'Vikram Rathore','vikram.rathore@mail.com','9876500027','Jodhpur',5),
(28,'Anjali Desai','anjali.desai@mail.com','9876500028','Surat',5),
(29,'Karthik Subramaniam','karthik.s@mail.com','9876500029','Chennai',5),
(30,'Farah Sheikh','farah.sheikh@mail.com','9876500030','Hyderabad',5);

create table staging_customer(stag_id int auto_increment primary key,
cus_id int,cus_name varchar(100),email varchar(100),
 phone varchar(20),city varchar(100),bat_id int,
valid_status varchar(20)); 

INSERT INTO Staging_Customer (cus_id,cus_name,email,phone,city,bat_id,valid_status)VALUES
(1,'Rakesh Iyer','rakesh.iyer@mail.com','9876500001','Chennai',1,'Valid'),
(2,'Fatima Ali','fatima.ali@mail.com','9876500002','Delhi',1,'Valid'),
(3,'Vivek Chauhan','vivek.chauhan@mail.com','9876500003','Mumbai',1,'Valid'),
(4,'Meenal Joshi',NULL,'9876500004','Pune',1,'Invalid'),                       
(5,'Sameer Khan','sameer.khan@mail.com','9876500005','Delhi',1,'Valid'),
(6,'Aarti Ghosh','aarti.ghosh@mail.com',NULL,'Kolkata',1,'Invalid'),          
(7,'Naveen Reddy','naveen.reddy@mail.com','9876500007','Hyderabad',2,'Valid'),
(8,'Bhavna Shah','bhavna.shah@mail.com','9876500008','Ahmedabad',2,'Valid'),
(9,'Kunal Sinha','kunal.sinha@mail.com','9876500009','Patna',2,'Valid'),
(10,'Ishita Bansal','ishita.bansal@mail.com','9876500010','Jaipur',2,'Valid'),
(11,'Pranav Menon','pranav.menon@mail.com','9876500011','Kochi',2,'Valid'),
(12,'Ritu Malhotra','ritu.malhotra@mail.com','9876500012','Chandigarh',2,'Valid'),
(13,'Ajay Pandey','ajay.pandey@mail.com','9876500013','Lucknow',3,'Valid'),
(14,'Sunita Rao','sunita.rao@mail.com','9876500014','Bengaluru',3,'Valid'),
(15,'Deepak Nanda','deepak.nanda@mail.com','9876500015','Bhubaneswar',3,'Valid'),
(16,NULL,'ananya.rao@mail.com','9876500016','Chennai',3,'Invalid'),            
(17,'Rahul Mehta','rahul.mehta@mail.com','9876500017','Mumbai',3,'Valid'),
(18,'Priya Nair','priya.nair@mail.com','9876500018','Kochi',3,'Valid'),
(19,'Kiran Shah','kiran.shah@mail.com','9876500019','Surat',4,'Valid'),
(20,'Arjun Verma','arjun.verma@mail.com','9876500020','Delhi',4,'Valid'),
(21,'Sneha Kapoor',NULL,NULL,'Pune',4,'Invalid'),                             
(22,'Manoj Pillai','manoj.pillai@mail.com','9876500022','Chennai',4,'Valid'),
(23,'Divya Menon','divya.menon@mail.com','9876500023','Kochi',4,'Valid'),
(24,'Rohit Nair','rohit.nair@mail.com','9876500024','Bengaluru',4,'Valid'),
(25,'Sanjay Kumar','sanjay.kumar@mail.com','9876500025','Guwahati',5,'Valid'),
(26,'Neha Joshi','neha.joshi@mail.com','9876500026','Jaipur',5,'Valid'),
(27,'Vikram Rathore','vikram.rathore@mail.com',NULL,'Jodhpur',5,'Invalid'),    
(28,'Anjali Desai','anjali.desai@mail.com','9876500028','Surat',5,'Valid'),
(29,'Karthik Subramaniam','karthik.s@mail.com','9876500029','Chennai',5,'Valid'),
(30,'Farah Sheikh','farah.sheikh@mail.com','9876500030','Hyderabad',5,'Valid'),
(3,'Vivek Chauhan','vivek.chauhan@mail.com','9876500003','Mumbai',1,'Invalid'),
(7,'Naveen Reddy','naveen.reddy@mail.com','9876500007','Hyderabad',2,'Invalid'),
(12,'Ritu Malhotra','ritu.malhotra@mail.com','9876500012','Chandigarh',2,'Invalid'),
(18,'Priya Nair','priya.nair@mail.com','9876500018','Kochi',3,'Invalid'),
(25,'Sanjay Kumar','sanjay.kumar@mail.com','9876500025','Guwahati',5,'Invalid');

create table warehouse_customer( ware_id int auto_increment primary key,
cus_id int ,cus_name varchar(100),email varchar(100),
phone varchar(20),city varchar(100),bat_id int,load_date date);

INSERT INTO Warehouse_Customer(cus_id,cus_name,email,phone,city,bat_id,load_date) VALUES
(1,'Rakesh Iyer','rakesh.iyer@mail.com','9876500001','Chennai',1,'2026-06-25'),
(2,'Fatima Ali','fatima.ali@mail.com','9876500002','Delhi',1,'2026-06-25'),
(3,'Vivek Chauhan','vivek.chauhan@mail.com','9876500003','Mumbai',1,'2026-06-25'),
(5,'Sameer Khan','sameer.khan@mail.com','9876500005','Delhi',1,'2026-06-25'),
(7,'Naveen Reddy','naveen.reddy@mail.com','9876500007','Hyderabad',2,'2026-06-26'),
(8,'Bhavna Shah','bhavna.shah@mail.com','9876500008','Ahmedabad',2,'2026-06-26'),
(9,'Kunal Sinha','kunal.sinha@mail.com','9876500009','Patna',2,'2026-06-26'),
(10,'Ishita Bansal','ishita.bansal@mail.com','9876500010','Jaipur',2,'2026-06-26'),
(11,'Pranav Menon','pranav.menon@mail.com','9876500011','Kochi',2,'2026-06-26'),
(12,'Ritu Malhotra','ritu.malhotra@mail.com','9876500012','Chandigarh',2,'2026-06-26'),
(13,'Ajay Pandey','ajay.pandey@mail.com','9876500013','Lucknow',3,'2026-06-27'),
(14,'Sunita Rao','sunita.rao@mail.com','9876500014','Bengaluru',3,'2026-06-27'),
(15,'Deepak Nanda','deepak.nanda@mail.com','9876500015','Bhubaneswar',3,'2026-06-27'),
(17,'Rahul Mehta','rahul.mehta@mail.com','9876500017','Mumbai',3,'2026-06-27'),
(18,'Priya Nair','priya.nair@mail.com','9876500018','Kochi',3,'2026-06-27'),
(19,'Kiran Shah','kiran.shah@mail.com','9876500019','Surat',4,'2026-06-28'),
(20,'Arjun Verma','arjun.verma@mail.com','9876500020','Delhi',4,'2026-06-28'),
(22,'Manoj Pillai','manoj.pillai@mail.com','9876500022','Chennai',4,'2026-06-28'),
(23,'Divya Menon','divya.menon@mail.com','9876500023','Kochi',4,'2026-06-28'),
(24,'Rohit Nair','rohit.nair@mail.com','9876500024','Bengaluru',4,'2026-06-28'),
(1,'Rakesh Iyer','rakesh.iyer@mail.com','9876500001','Chennai',1,'2026-06-29'),   
(5,'Sameer Khan','sameer.khan@mail.com','9876500005','Delhi',1,'2026-06-29'),    
(10,'Ishita Bansal','ishita.bansal@mail.com','9876500010','Jaipur',2,'2026-06-29'), 
(15,'Deepak Nanda','deepak.nanda@mail.com','9876500015','Bhubaneswar',3,'2026-06-29'), 
(20,'Arjun Verma','arjun.verma@mail.com','9876500020','Delhi',4,'2026-06-29'),   
(2,'Fatima Ali','fatima.ali@mail.com','9876500002','Delhi',1,'2026-06-29'),       
(8,'Bhavna Shah','bhavna.shah@mail.com','9876500008','Ahmedabad',2,'2026-06-29'), 
(13,'Ajay Pandey','ajay.pandey@mail.com','9876500013','Lucknow',3,'2026-06-29'),  
(19,'Kiran Shah','kiran.shah@mail.com','9876500019','Surat',4,'2026-06-29'),      
(24,'Rohit Nair','rohit.nair@mail.com','9876500024','Bengaluru',4,'2026-06-29');

create table reject_record(reject_id int auto_increment primary key,
cus_id int,bat_id int,reject_reason varchar(200));

INSERT INTO Reject_Record(cus_id,bat_id,reject_reason) VALUES(4,1,'NULL Email'),
(6,1,'Invalid Phone Number'),(16,3,'Missing Customer Name'),
(21,4,'NULL Email'),(27,5,'Invalid Phone Number'),
(3,1,'Duplicate Record'),(7,2,'Duplicate Record'),(25,5,'Duplicate Record');

-- 21th /output
select b.batch_date, count(st.stag_id) as record_count,
lag(count(st.stag_id)) over(order by batch_date ) as previous,
count(st.stag_id)- lag(count(st.stag_id)) over(order by batch_date )as difference
from batch_master b
join staging_customer st
on b.bat_id=st.bat_id
group by b.batch_date
order by b.batch_date;

-- 22nd /output
select cus_id,count(cus_id) as duplicate_no
from staging_customer
group by cus_id
having duplicate_no>1;

-- 23rd /output
select cus_id,cus_name,email,phone
from staging_customer
where cus_name is null or email is null or phone is null;

-- 24th /output
select b.bat_id,b.batch_date,count(distinct st.stag_id),
count(distinct  case when st.valid_status='valid' then st.stag_id end) as res,
count(distinct r.reject_reason) as reject
from batch_master b
join staging_customer st
on b.bat_id=st.bat_id
join reject_record r
on st.bat_id=r.bat_id
group by b.bat_id,b.batch_date;

-- 25th /output
select cus_id,bat_id,reject_reason
from reject_record
order by cus_id,bat_id ;

-- 26th /output
create temporary table invalid as
select * from staging_customer
where valid_status='invalid';

select * from invalid;

-- 27th /output
select so.cus_id,so.cus_name
from source_customer so
left join warehouse_customer w
on so.cus_id=w.cus_id
where w.cus_id is null;

-- 28th /output
select cus_id,count(cus_id)
from warehouse_customer
group by cus_id
having count(cus_id)>1;

-- 29th /output
select count(distinct so.cus_id),count(distinct w.cus_id),
(select count(distinct r.cus_id) from reject_record r) as res,
count(distinct case when r.cus_id is not null then w.bat_id end)as difference
from source_customer so
 left join warehouse_customer w
on so.cus_id=w.cus_id
left join reject_record r
on w.bat_id=r.bat_id;
	
-- 30th /output
select 'Source_Customer' as table_name, b.Batch_Date, count(*) as Res,
count(*) - lag(count(*)) over ( order by Batch_Date) AS Daily
from  Source_Customer so join Batch_Master b 
on b.Bat_id = so.Bat_id
group by b.Batch_Date
union all
select 'Staging_Customer' table_name, b.Batch_Date, COUNT(*),
count(*) - lag(count(*)) over ( order by Batch_Date) AS Daily
from Staging_Customer st join Batch_Master b 
on b.Bat_id = st.Bat_id
group by  b.Batch_Date
union all
select 'Warehouse_Customer' as table_name, b.Batch_Date, COUNT(*),
count(*)  - lag(count(*)) over ( order by Batch_Date) AS Daily
from Warehouse_Customer w join Batch_Master b 
on b.Bat_id = w.Bat_id
group by b.Batch_Date;

-- model-4
create table branch(branch_id int primary key,
branch_name varchar(100),city varchar(100));

INSERT INTO Branch  VALUES(1,'MG Road Branch','Bangalore'),
(2,'T Nagar Branch','Chennai'),(3,'Banjara Hills Branch','Hyderabad'),
(4,'Andheri Branch','Mumbai'),(5,'Connaught Place Branch','Delhi');

create table customer1(cus_id int,cus_name varchar(100),mobile_no varchar(15),
city varchar(100));

INSERT INTO Customer1 VALUES
(1,'Rakesh Iyer','9876510000','Bangalore'),(2,'Fatima Ali','9876510001','Chennai'),
(3,'Vivek Chauhan','9876510002','Hyderabad'),(4,'Meenal Joshi','9876510003','Mumbai'),
(5,'Sameer Khan','9876510004','Delhi'),(6,'Aarti Ghosh','9876510005','Bangalore'),
(7,'Naveen Reddy','9876510006','Chennai'),(8,'Bhavna Shah','9876510007','Hyderabad'),
(9,'Kunal Sinha','9876510008','Mumbai'),(10,'Ishita Bansal','9876510009','Delhi'),
(11,'Pranav Menon','9876510010','Bangalore'),(12,'Ritu Malhotra','9876510011','Chennai'),
(13,'Ajay Pandey','9876510012','Hyderabad'),(14,'Sunita Rao','9876510013','Mumbai'),
(15,'Deepak Nanda','9876510014','Delhi'),(16,'Ananya Rao','9876510015','Bangalore'),
(17,'Rahul Mehta','9876510016','Chennai'),(18,'Priya Nair','9876510017','Hyderabad'),
(19,'Kiran Shah','9876510018','Mumbai'),(20,'Arjun Verma','9876510019','Delhi');

create table accounts(acc_id int,cus_id int,
branch_id int,acc_type varchar(100),open_date date,
balance decimal(10,2),acc_status varchar(20));

INSERT INTO Accounts VALUES
(5001,1,3,'Savings','2023-07-21',45315,'Active'),(5002,1,1,'Salary','2023-02-12',325548,'Active'),
(5003,2,1,'Salary','2023-04-02',65061,'Active'),(5004,2,4,'Current','2023-02-08',67559,'Active'),
(5005,3,5,'Current','2023-01-27',316460,'Active'),(5006,3,1,'Savings','2023-11-21',325658,'Active'),
(5007,4,1,'Salary','2023-10-13',45999,'Active'),(5008,4,2,'Savings','2023-09-28',89821,'Active'),
(5009,5,3,'Current','2023-03-18',81757,'Active'),(5010,5,5,'Current','2023-09-27',377565,'Active'),
(5011,6,2,'Savings','2023-10-19',354974,'Active'),(5012,6,2,'Current','2023-02-18',9114,'Closed'),
(5013,7,5,'Savings','2023-10-07',280264,'Active'),(5014,7,5,'Current','2023-06-15',43375,'Closed'),
(5015,8,4,'Current','2023-05-08',114249,'Active'),(5016,8,2,'Savings','2023-10-10',39419,'Closed'),
(5017,9,4,'Current','2023-12-15',170962,'Active'),(5018,9,5,'Savings','2023-02-17',32402,'Closed'),
(5019,10,2,'Current','2023-03-16',241091,'Active'),(5020,10,1,'Salary','2023-02-25',41574,'Closed'),
(5021,11,5,'Current','2023-06-23',203594,'Active'),(5022,12,5,'Current','2023-10-26',259182,'Active'),
(5023,13,1,'Savings','2023-05-16',385450,'Active'),(5024,14,1,'Savings','2023-12-23',182323,'Active'),
(5025,15,5,'Salary','2023-08-10',395719,'Active'),(5026,16,4,'Salary','2023-06-01',262061,'Active'),
(5027,17,3,'Savings','2023-10-04',278837,'Active'),(5028,18,1,'Savings','2023-05-05',149821,'Active'),
(5029,19,4,'Current','2023-08-03',107223,'Active'),(5030,20,4,'Current','2023-09-09',91788,'Active');

create table transactions(trans_id int auto_increment primary key,acc_id int,trans_date date,
trans_type varchar(20),trans_amt decimal(12,2));

INSERT INTO Transactions(acc_id,trans_date,trans_type,trans_amt) 
VALUES(5001,'2026-05-28','Withdrawal',31611),
(5001,'2026-05-16','Deposit',14101),(5002,'2026-03-05','Deposit',31267),
(5003,'2026-04-21','Deposit',27962),(5004,'2026-01-02','Deposit',36627),
(5005,'2026-05-01','Deposit',17855),(5006,'2026-05-27','Withdrawal',30870),
(5006,'2026-02-21','Deposit',36021),(5007,'2026-06-03','Withdrawal',2301),
(5007,'2026-04-18','Withdrawal',20229),(5008,'2026-02-17','Withdrawal',22662),
(5009,'2026-05-25','Deposit',6602),(5009,'2026-01-28','Deposit',28240),
(5010,'2026-01-28','Withdrawal',6379),(5010,'2026-02-02','Deposit',15992),
(5011,'2026-04-03','Withdrawal',28045),(5011,'2026-03-03','Deposit',19680),
(5012,'2026-04-25','Withdrawal',2992),(5012,'2026-02-23','Deposit',10820),
(5013,'2026-04-26','Deposit',5925),(5014,'2026-02-15','Deposit',38653),
(5014,'2026-04-21','Deposit',10583),(5015,'2026-04-07','Deposit',27877),
(5015,'2026-05-10','Deposit',19681),(5016,'2026-04-28','Deposit',14275),
(5017,'2026-02-15','Deposit',11591),(5018,'2026-03-13','Deposit',23558),
(5018,'2026-01-07','Deposit',6868),(5019,'2026-03-20','Deposit',26161),
(5020,'2026-05-05','Deposit',33701),(5020,'2026-06-05','Withdrawal',13981),
(5021,'2026-06-07','Deposit',18351),(5021,'2026-02-22','Deposit',38302),
(5022,'2026-04-02','Withdrawal',7144),(5022,'2026-01-17','Deposit',9146),
(5023,'2026-03-14','Deposit',27664),(5023,'2026-05-06','Withdrawal',21230),
(5024,'2026-04-18','Deposit',16968),(5025,'2026-02-24','Withdrawal',15919),
(5026,'2026-04-15','Deposit',19641),(5027,'2026-02-10','Deposit',5053),
(5028,'2026-03-05','Deposit',8041),(5028,'2026-06-24','Withdrawal',23690),
(5029,'2026-04-12','Deposit',3172),(5030,'2026-05-21','Deposit',3393),
(5030,'2026-01-24','Deposit',33603),(5001,'2026-03-05','Deposit',30385),
(5002,'2026-01-15','Deposit',14746),(5003,'2026-03-24','Deposit',45788),
(5004,'2026-06-24','Deposit',12914),(5005,'2026-02-26','Deposit',56117),
(5006,'2026-03-03','Deposit',32388),(5007,'2026-04-03','Deposit',54901),
(5008,'2026-01-28','Deposit',37338),(5009,'2026-05-01','Deposit',42763),
(5010,'2026-06-13','Deposit',50957),(5011,'2026-05-01','Deposit',34849),
(5012,'2026-01-03','Deposit',49902),(5013,'2026-06-04','Deposit',15940),
(5014,'2026-04-24','Deposit',26856),(5015,'2026-04-24','Deposit',31636),
(5016,'2026-05-15','Deposit',55492),(5017,'2026-04-27','Deposit',38870),
(5018,'2026-01-17','Deposit',45471),(5019,'2026-05-01','Deposit',59165),
(5020,'2026-05-03','Deposit',30331),(5021,'2026-01-08','Deposit',41519),
(5022,'2026-01-16','Deposit',55766),(5023,'2026-06-16','Deposit',50272),
(5024,'2026-01-12','Deposit',26766),(5025,'2026-02-22','Deposit',29728),
(5026,'2026-02-17','Deposit',50092),(5027,'2026-03-22','Deposit',21115),
(5028,'2026-04-08','Deposit',38962),(5029,'2026-04-22','Deposit',31427),
(5030,'2026-02-21','Deposit',26423),(5001,'2026-07-01','Withdrawal',126828),
(5011,'2026-07-01','Withdrawal',137623),(5021,'2026-07-01','Withdrawal',163620);

create table transaction_audit(audit_id int auto_increment primary key,
trans_id int,acc_id int,
trans_amt decimal(12,2),delete_date datetime);

-- 31st /output
select b.branch_name,sum(t.trans_amt) as total_deposit
from branch b join accounts a 
on b.branch_id=a.branch_id
join transactions t
on a.acc_id=t.acc_id
group by b.branch_name
order by total_deposit desc;

-- 32nd /output
select c1.cus_name,count(a.acc_status)
from customer1 c1 join accounts a
on c1.cus_id=a.cus_id
where a.acc_status='active'
group by c1.cus_name
having count(a.acc_status)>1;

-- 33rd /output
with latest_transactions as(
select distinct acc_id,trans_date,trans_type,trans_amt,
row_number() over(partition by acc_id order by trans_date desc) as rank_no
from  transactions )
select acc_id,trans_date,trans_type,trans_amt
from latest_transactions
where rank_no=1 ;

-- 34th /output
select c1.cus_name,sum(t.trans_amt),rank() 
over(order by sum(t.trans_amt) desc) as result
from customer1 c1 join accounts a 
on c1.cus_id=a.cus_id join transactions t
on a.acc_id=t.acc_id
 group by c1.cus_name;

-- 35th /output
select c1.Cus_Name,t.Acc_ID,t.Trans_Date,t.Trans_Amt,
(select avg(t2.Trans_Amt) from Transactions t2 
 join Accounts a2 
on t2.Acc_ID = a2.Acc_ID
where a2.Cus_ID = c1.Cus_ID) AS Customer_Average 
from Customer c1
 join Accounts a 
on c1.Cus_ID = a.Cus_ID 
 join Transactions t 
on a.Acc_ID = t.Acc_ID
where t.Trans_Amt >3 * (select avg(t2.Trans_Amt) from Transactions t2
 join Accounts a2 on t2.Acc_ID = a2.Acc_ID
where a2.Cus_ID = c1.Cus_ID)
order by t.Trans_Amt desc;

-- 36th /output
create view trans_summary as
select b.branch_name,count(t.trans_id),
sum(case when t.trans_type='deposit' then t.trans_amt 
 else 0 end) as total_deposit,
sum(case when t.trans_type='withdrawal' then t.trans_amt
else 0 end) as total_withdraw
from branch b join accounts a
on b.branch_id=a.branch_id
join transactions t
on a.acc_id=t.acc_id
group by b.branch_name;

select * from trans_summary;

-- 37th /output
delimiter //
 create procedure cus_account(in account_id int)
 begin 
 select a.acc_id,t.trans_date,
 t.trans_type,t.trans_amt,a.balance
 from accounts a join transactions t 
 on a.acc_id=t.acc_id
 where t.acc_id=account_id
 order by a.acc_id ;
 end //
 delimiter ;

call cus_account(5001);

-- 38th /output
delimiter //
create trigger trg_after_delete
after delete 
on transactions 
for each row
 begin 
insert into transaction_audit
(trans_id,acc_id,trans_amt,delete_date)values
 (old.trans_id,old.acc_id,old.trans_amt,now());
 end //
 delimiter ;
 
 select * from transaction_audit;
 
delete from transactions
where trans_id in(1,2);

select * from transaction_audit;

-- 39th /output
delimiter //
create trigger trg_before_insert
before insert 
on transactions 
for each row
 begin 
 if new.trans_amt<0 then
 signal sqlstate'45000'
set message_text='trans_amt cannot be negative';
end if;
 end //
 delimiter ;
 
 insert into transactions(acc_id,trans_date,trans_type,trans_amt) values
 (5001,'2026-07-02','deposit',5000);

 insert into transactions(acc_id,trans_date,trans_type,trans_amt) values
 (5001,'2026-07-02','deposit',-5000);

select * from transactions;

-- 40th /output
create index trans_search_idx
on transactions(acc_id,trans_date,trans_type);

show index from transactions;

select * from transactions 
where acc_id=5001;

select * from transactions 
where acc_id=5001 or trans_type='deposit';

-- model-5
create table department_tab(dep_id int primary key,dep_name varchar(100));
 
 INSERT INTO department_tab  VALUES
(1,'HR'),(2,'Finance'),(3,'IT'),(4,'Sales'),(5,'Marketing');

create table employee_tab(
emp_id int, emp_name varchar(50),dep_id int,sal decimal(10,2),
hire_date date);

INSERT INTO Employee_tab  VALUES
(1,'Ananya Rao',1,66620,'2024-12-14'),(2,'Rahul Mehta',2,128230,'2022-08-27'),
(3,'Priya Nair',3,73313,'2025-09-06'),(4,'Kiran Shah',4,111202,'2021-01-01'),
(5,'Deepa Iyer',5,93633,'2024-02-05'),(6,'Arjun Verma',1,149038,'2021-04-23'),
(7,'Sneha Kapoor',2,50548,'2024-12-25'),(8,'Manoj Pillai',3,98316,'2025-01-11'),
(9,'Divya Menon',4,115798,'2025-12-04'),(10,'Rohit Nair',5,130041,'2023-01-05'),
(11,'Sanjay Kumar',1,142127,'2019-02-26'),(12,'Neha Joshi',2,47562,'2025-03-18'),
(13,'Vikram Rathore',3,140480,'2023-07-16'),(14,'Anjali Desai',4,64804,'2020-11-02'),
(15,'Karthik Subramaniam',5,106596,'2021-02-25'),(16,'Farah Sheikh',1,70870,'2021-11-26'),
(17,'Imran Qureshi',2,131244,'2019-02-18'),(18,'Meera Pillai',3,107432,'2024-04-11'),
(19,'Aditya Bose',4,64156,'2024-05-12'),(20,'Nikhil Chawla',5,104155,'2024-06-16'),
(21,'Pooja Reddy',1,95671,'2022-01-27'),(22,'Suresh Babu',2,57224,'2020-12-23'),
(23,'Tanvi Kulkarni',3,110013,'2018-08-03'),(24,'Yusuf Ali',4,117146,'2021-10-20'),
(25,'Ritika Bhat',5,86764,'2019-03-22'),(26,'Harish Chandra',1,67294,'2023-06-12'),
(27,'Lavanya Krishnan',2,144857,'2022-04-04'),(28,'Omkar Deshpande',3,67110,'2019-03-25'),
(29,'Zara Khan',4,101192,'2023-03-22'),(30,'Ishaan Malhotra',5,49809,'2021-07-06');

create table emp_history_tab(his_id int auto_increment primary key,emp_id int,
emp_name varchar(100),dep_id int,sal decimal,
effective_date date);

INSERT INTO Emp_History_tab(emp_id,emp_name,dep_id,sal,effective_date) VALUES
(1,'Ananya Rao',1,66620,'2024-12-14'),(2,'Rahul Mehta',2,128230,'2022-08-27'),
(3,'Priya Nair',3,73313,'2025-09-06'),(4,'Kiran Shah',4,111202,'2021-01-01'),
(5,'Deepa Iyer',5,93633,'2024-02-05'),(6,'Arjun Verma',1,149038,'2021-04-23'),
(7,'Sneha Kapoor',2,50548,'2024-12-25'),(8,'Manoj Pillai',3,98316,'2025-01-11'),
(9,'Divya Menon',4,115798,'2025-12-04'),(10,'Rohit Nair',5,130041,'2023-01-05'),
(11,'Sanjay Kumar',1,142127,'2019-02-26'),(12,'Neha Joshi',2,47562,'2025-03-18'),
(13,'Vikram Rathore',3,140480,'2023-07-16'),(14,'Anjali Desai',4,64804,'2020-11-02'),
(15,'Karthik Subramaniam',5,106596,'2021-02-25'),(16,'Farah Sheikh',1,70870,'2021-11-26'),
(17,'Imran Qureshi',2,131244,'2019-02-18'),(18,'Meera Pillai',3,107432,'2024-04-11'),
(19,'Aditya Bose',4,64156,'2024-05-12'),(20,'Nikhil Chawla',5,104155,'2024-06-16'),
(21,'Pooja Reddy',1,95671,'2022-01-27'),(22,'Suresh Babu',2,57224,'2020-12-23'),
(23,'Tanvi Kulkarni',3,110013,'2018-08-03'),(24,'Yusuf Ali',4,117146,'2021-10-20'),
(25,'Ritika Bhat',5,86764,'2019-03-22'),(26,'Harish Chandra',1,67294,'2023-06-12'),
(27,'Lavanya Krishnan',2,144857,'2022-04-04'),(28,'Omkar Deshpande',3,67110,'2019-03-25'),
(29,'Zara Khan',4,101192,'2023-03-22'),(30,'Ishaan Malhotra',5,49809,'2021-07-06'),
(24,'Yusuf Ali',4,109487,'2022-01-15'),(19,'Aditya Bose',4,51960,'2022-01-15'),
(1,'Ananya Rao',1,48941,'2022-01-15'),(12,'Neha Joshi',2,41622,'2022-01-15'),
(16,'Farah Sheikh',1,65016,'2022-01-15'),(17,'Imran Qureshi',3,115457,'2022-01-15'),
(13,'Vikram Rathore',4,128607,'2022-01-15'),(22,'Suresh Babu',3,45761,'2022-01-15'),
(8,'Manoj Pillai',3,87777,'2022-01-15'),(23,'Tanvi Kulkarni',3,102620,'2022-01-15');

create table category_tab(cat_id int,cat_name varchar(100));

INSERT INTO Category_tab VALUES (1,'Electronics'),
(2,'Clothing'),(3,'Grocery'),(4,'Furniture'),(5,'Sports');

create table product_tab(pro_id int,pro_name varchar(100),
cat_id int,unit_price decimal(10,2));

INSERT INTO Product_tab  VALUES
(1,'Smartphone X',1,45000),(2,'Laptop Pro',1,72000),
(3,'Wireless Earbuds',1,3500),(4,'Smartwatch',1,9000),
(5,'4K Television',1,55000),(6,'Cotton T-Shirt',2,699),
(7,'Denim Jeans',2,1499),(8,'Formal Shirt',2,999),
(9,'Winter Jacket',2,2999),(10,'Casual Hoodie',2,1299),
(11,'Basmati Rice 5kg',3,650),(12,'Cooking Oil 1L',3,180),
(13,'Sugar 1kg',3,55),(14,'Wheat Flour 5kg',3,320),
(15,'Green Tea Pack',3,250),(16,'Office Chair',4,6500),
(17,'Wooden Dining Table',4,18000),(18,'Bookshelf',4,4200),
(19,'Sofa Set',4,32000),(20,'Study Desk',4,5200),
(21,'Cricket Bat',5,2200),(22,'Football',5,900),
(23,'Yoga Mat',5,650),(24,'Badminton Racket',5,1200),
(25,'Running Shoes',5,3200);

create table customer_tab(cus_id int,
cus_name varchar(100),region varchar(50));

INSERT INTO Customer_tab VALUES
(1,'Rakesh Iyer','North'),(2,'Fatima Ali','South'),
(3,'Vivek Chauhan','East'),(4,'Meenal Joshi','West'),
(5,'Sameer Khan','North'),(6,'Aarti Ghosh','South'),
(7,'Naveen Reddy','East'),(8,'Bhavna Shah','West'),
(9,'Kunal Sinha','North'),(10,'Ishita Bansal','South'),
(11,'Pranav Menon','East'),(12,'Ritu Malhotra','West'),
(13,'Ajay Pandey','North'),(14,'Sunita Rao','South'),
(15,'Deepak Nanda','East'),(16,'Rohan Kapoor','West'),
(17,'Simran Sethi','North'),(18,'Gaurav Oberoi','South'),
(19,'Anushka Bajaj','East'),(20,'Vikas Tiwari','West');

create table orders(order_id int,
cus_id int,order_date date);

INSERT INTO Orders  VALUES
(1,1,'2026-12-24'),(2,2,'2026-08-02'),(3,3,'2026-05-05'),
(4,4,'2026-11-17'),(5,5,'2026-12-16'),(6,6,'2026-01-07'),
(7,7,'2026-06-26'),(8,8,'2026-03-12'),(9,9,'2026-10-25'),
(10,10,'2026-07-16'),(11,11,'2026-10-28'),(12,12,'2026-08-10'),
(13,13,'2026-03-18'),(14,14,'2026-10-09'),(15,15,'2026-03-25'),
(16,16,'2026-12-01'),(17,17,'2026-07-22'),(18,18,'2026-03-23'),
(19,19,'2026-01-09'),(20,20,'2026-10-11'),(21,1,'2026-11-08'),
(22,2,'2026-10-14'),(23,3,'2026-05-22'),(24,4,'2026-07-25'),
(25,5,'2026-03-05'),(26,6,'2026-03-04'),(27,7,'2026-07-04'),
(28,8,'2026-03-01'),(29,9,'2026-11-15'),(30,10,'2026-03-03');

create table fact_sale(sale_id int,order_id int,
pro_id int,quantity int,sale_amt decimal(10,2),
bat_id int);

INSERT INTO Fact_Sale VALUES(1,19,6,6,4194.0,1),
(2,8,9,4,11996.0,1),(3,21,18,5,21000.0,1),
(4,6,21,5,11000.0,1),(5,17,11,6,3900.0,1),
(6,17,16,4,26000.0,1),(7,10,22,6,5400.0,1),
(8,3,10,4,5196.0,1),(9,10,17,4,72000.0,1),
(10,29,2,6,432000.0,1),(11,20,24,6,7200.0,1),
(12,14,9,3,8997.0,1),(13,18,25,6,19200.0,2),
(14,8,4,1,9000.0,2),(15,11,10,2,2598.0,2),
(16,29,3,6,21000.0,2),(17,12,4,6,54000.0,2),
(18,11,25,2,6400.0,2),(19,17,9,3,8997.0,2),
(20,1,12,5,900.0,2),(21,22,10,5,6495.0,2),
(22,13,13,2,110.0,2),(23,22,4,1,9000.0,2),
(24,12,21,6,13200.0,3),(25,22,18,1,4200.0,3),
(26,3,5,1,55000.0,3),(27,4,11,1,650.0,3),
(28,2,14,3,960.0,3),(29,12,7,2,2998.0,3),
(30,22,21,4,8800.0,3),(31,15,20,4,20800.0,3),
(32,26,12,5,900.0,3),(33,18,15,3,750.0,3),
(34,16,3,1,3500.0,3),(35,16,13,4,220.0,4),
(36,25,25,3,9600.0,4),(37,4,22,2,1800.0,4),
(38,1,18,6,25200.0,4),(39,15,24,3,3600.0,4),
(40,28,23,2,1300.0,4),(41,30,16,6,39000.0,4),
(42,20,16,1,6500.0,4),(43,23,3,5,17500.0,4),
(44,30,24,3,3600.0,4),(45,15,9,4,11996.0,4);

create table staging_sale(sale_id int,order_id int,
pro_id int,quantity int,sale_amt decimal(10,2),
valid_status varchar(20),bat_id int);

INSERT INTO Staging_Sale VALUES
(101,17,14,3,960.0,'Valid',5),(102,16,20,4,20800.0,'Valid',5),
(103,13,1,4,180000.0,'Valid',5),(104,11,11,2,1300.0,'Valid',5),
(105,4,6,6,4194.0,'Valid',5),(106,11,20,3,15600.0,'Valid',5),
(107,30,20,2,10400.0,'Valid',5),(108,25,24,3,3600.0,'Valid',5),
(109,27,14,4,1280.0,'Valid',5),(110,30,11,6,3900.0,'Valid',5),
(111,28,12,5,900.0,'Valid',5),(112,22,17,1,18000.0,'Valid',5),
(113,28,24,6,7200.0,'Valid',5),(114,29,24,1,1200.0,'Valid',5),
(115,8,16,1,6500.0,'Valid',5),(116,26,9,5,14995.0,'Valid',5),
(117,3,19,1,32000.0,'Valid',5),(118,7,7,2,2998.0,'Valid',5),
(119,20,3,1,3500.0,'Valid',5),(120,30,22,1,900.0,'Valid',5),
(121,19,14,5,1600.0,'Valid',5),(122,22,12,1,180.0,'Valid',5),
(123,28,5,4,220000.0,'Valid',5),(124,1,3,2,7000.0,'Valid',5),
(125,15,2,1,72000.0,'Valid',5),(126,19,25,2,6400.0,'Valid',5),
(127,26,18,2,8400.0,'Valid',5),(128,22,4,3,27000.0,'Valid',5),
(129,12,3,6,21000.0,'Valid',5),(130,16,10,1,1299.0,'Valid',5),
(131,25,22,1,900.0,'Valid',5),(132,26,1,4,180000.0,'Valid',5),
(133,28,10,5,6495.0,'Valid',5),(134,11,11,5,3250.0,'Valid',5),
(135,5,24,3,3600.0,'Valid',5),(136,4,11,4,2600.0,'Valid',5),
(137,16,25,4,12800.0,'Valid',5),(138,9,7,1,1499.0,'Valid',5),
(139,17,7,2,2998.0,'Valid',5),(140,9,4,2,18000.0,'Valid',5),
(141,14,17,2,NULL,'Invalid',5),(142,5,16,-5,32500.0,'Invalid',5),
(143,15,NULL,3,750.0,'Invalid',5),(144,21,24,2,NULL,'Invalid',5),
(145,1,1,-1,45000.0,'Invalid',5);

create table etl_batch(bat_id int,bat_date date,
source_count int,stag_count int,ware_count int);

INSERT INTO ETL_Batch  VALUES(1,'2026-06-25',12,12,12),
(2,'2026-06-26',11,11,11),(3,'2026-06-27',12,13,11),
(4,'2026-06-28',11,11,11),(5,'2026-06-29',45,45,0);

create table factsale_audit(audit_id int auto_increment primary key,sale_id int,
action_type varchar(20),action_date datetime);

-- 41st /output
with dep_salary as(
select dep_id,avg(sal) as avg_sal
from  employee_tab
group by dep_id)
select dt.dep_name,et.emp_name,et.sal,ds.avg_sal
from employee_tab et
join dep_salary ds
on et.dep_id=ds.dep_id
join department_tab dt
on et.dep_id=dt.dep_id
where et.sal>ds.avg_sal
order by dt.dep_name desc;

-- 42nd /output
with topproduct as(
select c2.cat_name,pt.pro_name,sum(f.sale_amt) as total,dense_rank() 
over( partition by c2.cat_name order by sum(f.sale_amt) desc) as dense_num
from category_tab c2 
join product_tab pt
on c2.cat_id=pt.cat_id
join fact_sale f
on pt.pro_id=f.pro_id
 group by c2.cat_name,pt.pro_name )
select cat_name,pro_name,total,dense_num
from topproduct
where dense_num <=5;

-- 43rd /output
create temporary table top_sell as
select pt.pro_id,sum(f.sale_amt),sum(f.quantity)
from product_tab pt
join fact_sale f
on pt.pro_id=f.pro_id
group by pt.pro_id
order by sum(f.sale_amt) desc;

select * from top_sell;

-- 44th /output
delimiter //
create procedure warehouse_load(
in s_id int,in o_id int,in p_id int,
in q_id int,in s_amt decimal(10,2),in b_id int)
begin 
insert into fact_sale values(s_id,o_id,
p_id,q_id,s_amt,b_id);

select * from staging_sale
where valid_status='valid';

end //
delimiter ;

call warehouse_load(46,8,4,2,1100.0,1);

-- 45th /output
delimiter //
create trigger trg_fact_insert
after insert 
on  fact_sale
for each row
 begin 
 insert into factsale_audit(sale_id,action_type,action_date)
 values(new.sale_id,'insert',now());
end //

create trigger trg_fact_update
after update 
on fact_sale 
for each row
 begin 
insert into factsale_audit
(sale_id,action_type,action_date)values
 (new.sale_id,'update',now());
end //

create trigger after_fact_delete
after delete 
on fact_sale 
for each row
 begin 
insert into factsale_audit
(sale_id,action_type,action_date)values
 (old.sale_id,'delete',now());
 end //
 delimiter ;
 
 select * from factsale_audit;
 
 insert into fact_sale(sale_id,order_id,pro_id,quantity,sale_amt,bat_id)
values (9001,1,1,2,90000,1);

update fact_sale set sale_amt=95000 where sale_id=9001;

delete from fact_sale where sale_id=9001;

select * from factsale_audit;

-- 46th /output
create view business_report as
select ct.cus_name,o.order_id,o.order_date,
f.pro_id,f.quantity,f.sale_amt
from customer_tab ct
join orders o
on ct.cus_id=o.cus_id
join fact_sale f
on o.order_id=f.order_id;

select * from business_report;

-- 47th /output
create index idx_perform
on customer_tab (cus_id);

create index idx_perform1
on orders (order_id);

create index idx_perform2
on product_tab (pro_id);

create index idx_perform3
on fact_sale(bat_id);

-- 48th /output
select bat_id,source_count,stag_count,
ware_count,source_count-ware_count as difference,
case when source_count=ware_count then 'successul load'
else 'partial successful load' end as result
from etl_batch 
order by bat_id;

-- 49th /output
with Latest as (select eh.*,row_number() over
 (partition by Emp_ID order by Effective_Date desc) as rn from Emp_History_tab eh),
previous as (select eh.*,row_number() over
 (partition by Emp_ID order by Effective_Date desc) as rn from Emp_History_tab eh)
select l.Emp_ID,l.Emp_Name,p.Sal AS old_Sal,l.sal as new_sal,
p.dep_id as old_dep,l.Dep_id AS New_Dep 
from latest l join previous p 
on p.Emp_ID = l.Emp_ID and p.rn=l.rn+1
where l.rn =1 and (l.Sal <> p.Sal or p.Dep_ID <> l.dep_id);
 
-- 50th 
-- 1st /output
select source_count,ware_count,
source_count-ware_count as diff
from etl_batch;

-- 2nd /output
select order_id,pro_id,count(*) as dup_record
from staging_sale
group by order_id,pro_id
having count(*)>1;

-- 3rd /output
select sale_id,pro_id,sale_amt
from staging_sale
where pro_id is null or sale_amt is null;

-- 4th /output
select sale_id,quantity
from staging_sale
where quantity<0;

-- 5th /output
select sale_id,valid_status
from staging_sale
where valid_status='invalid';

-- 6th /output
select count(*),sum(sale_amt),sum(quantity)
from fact_sale;

-- 7th /output
select ct.cus_id
from customer_tab ct join orders o
on ct.cus_id=o.cus_id
where ct.cus_id is null;

select pt.pro_id
from product pt join fact_sale f
on pt.pro_id=f.pro_id
where pt.pro_id is null;

-- 8th /output
select bat_id,source_count,stag_count,
case when source_count=ware_count then 'successul load'
else 'partial successful load' end as result
from etl_batch 
order by bat_id;

-- 9th /output
select count(*) as total,(select count(*) from staging_sale
where valid_status='valid') as res1,
(select count(*) from staging_sale
where valid_status='invalid') as res2,
(select count(*) from staging_sale
where valid_status='valid')/(select count(*) as total)*round(100,2) as data_quality
from staging_sale;










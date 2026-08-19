create database commontableexp;
use commontableexp;
CREATE TABLE Employee (
    Emp_ID INT, Emp_Name VARCHAR(100), Department VARCHAR(50),
    Salary DECIMAL(10,2), Age INT
);
INSERT INTO Employee VALUES
(1,'Rahul','IT',75000,29),(2,'Sneha','IT',82000,31),(3,'Vikram','IT',60000,26),
(4,'Anjali','HR',45000,24),(5,'Karan','HR',60000,35),(6,'Pooja','HR',52000,28),
(7,'Arjun','Sales',55000,30),(8,'Neha','Sales',70000,33),
(9,'Manish','Finance',90000,40),(10,'Divya','Finance',65000,27),
(11,'Aditya','Finance',68000,29),(12,'Ishita','Finance',55000,25);

With deptavg as(
select department,avg(salary) as dept_avg_sal
from employee
group by department),
comavg as(
select avg(salary) as com_avg_sal
from employee),
 qualifydept as(
 select d.department,d.dept_avg_sal
 from deptavg d 
 cross join comavg c
 where d.dept_avg_sal>c.com_avg_sal)
select e.emp_name,e.emp_id,e.salary,e.department,
q.dept_avg_sal,c.com_avg_sal
from employee e join qualifydept q 
on e.department=q.department
cross join comavg c
where e.salary>q.dept_avg_sal
order by e.department asc,e.salary desc ;

CREATE TABLE Customer (
    Customer_ID   INT PRIMARY KEY,
    Customer_Name VARCHAR(100));

CREATE TABLE Orders (
    Order_ID      INT PRIMARY KEY,
    Customer_ID   INT,
    Order_Date    DATE,
    Order_Amount  DECIMAL(10,2)
);

INSERT INTO Customer VALUES
(1,  'Rahul Gupta'),
(2,  'Simran Kaur'),
(3,  'Aditya Menon'),
(4,  'Kavya Krishnan'),
(5,  'Farhan Ali'),
(6,  'Meera Nambiar'),
(7,  'Sanjay Bhatt'),
(8,  'Ritu Chawla'),
(9,  'Nikhil Bansal'),
(10, 'Ishita Kapoor');

INSERT INTO Orders VALUES
(101, 1, '2025-03-10', 5000),
(102, 1, '2025-06-15', 7000),
(103, 1, '2026-01-20', 8000),
(104, 1, '2026-04-05', 6500),
(105, 2, '2025-02-01', 3000),
(106, 2, '2025-08-12', 4000),
(107, 3, '2026-01-15', 12000),
(108, 3, '2026-03-22', 15000),
(109, 3, '2026-05-30', 9000),
(110, 3, '2026-06-18', 11000),
(111, 4, '2024-11-11', 2000),
(112, 4, '2025-01-05', 2500),
(113, 5, '2026-02-10', 20000),
(114, 5, '2026-04-14', 18000),
(115, 5, '2026-06-01', 22000),
(116, 5, '2026-07-01', 25000),
(117, 6, '2025-05-05', 3000),
(118, 6, '2025-09-09', 3500),
(119, 6, '2025-12-01', 4000),
(120, 7, '2026-01-01', 6000),
(121, 7, '2026-02-02', 7000),
(122, 7, '2026-03-03', 8000),
(123, 7, '2026-04-04', 9000),
(124, 8, '2023-01-01', 1000),
(125, 8, '2023-05-05', 1500),
(126, 9, '2026-01-10', 10000),
(127, 9, '2026-02-15', 11000),
(128, 9, '2026-03-20', 12000),
(129, 9, '2026-04-25', 13000),
(130, 10, '2026-05-01', 5000);

WITH CustomerTotals AS (
    SELECT
        c.Customer_ID,
        c.Customer_Name,
        COUNT(o.Order_ID)         AS Total_Orders,
        SUM(o.Order_Amount)       AS Total_Purchase_Amount,
        MAX(o.Order_Date)         AS Latest_Order_Date
    FROM Customer c
    JOIN Orders o
        ON c.Customer_ID = o.Customer_ID
    GROUP BY c.Customer_ID,c.Customer_Name
),
OverallAvg AS (
    -- Step 2: average total purchase amount across all customers
    SELECT AVG(Total_Purchase_Amount) AS Avg_Purchase_Amount
    FROM CustomerTotals
)
-- Step 3: apply all three conditions
SELECT
    ct.Customer_ID,
    ct.Customer_Name,
    ct.Total_Orders,
    ct.Total_Purchase_Amount,
    ct.Latest_Order_Date,
    oa.Avg_Purchase_Amount
FROM CustomerTotals ct 
 JOIN OverallAvg oa
WHERE ct.Total_Purchase_Amount > oa.Avg_Purchase_Amount
  AND ct.Total_Orders > 3
  AND YEAR(ct.Latest_Order_Date) = YEAR(CURdate())
ORDER BY
    ct.Total_Purchase_Amount DESC,
    ct.Total_Orders DESC;
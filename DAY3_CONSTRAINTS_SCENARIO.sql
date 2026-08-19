create database constraints;
use constraints;

-- 1st
create table employee(emp_id  int primary key auto_increment);

insert into employee values();
select * from employee;
-- 2nd
create table customer(cus_id int,email varchar(50) unique);

insert into customer values(1,'gomu@gmail.com');
insert into customer values(2,'gomu@gmail.com');
-- 3rd
create table department(dep_id int primary key,
dep_name varchar(50) );

create table student(stu_id int primary key,
stu_name varchar(50),dep_id int,
foreign key (dep_id ) references department(dep_id));

insert into department values(11,'it');
insert into student values(1,'john',11);

-- 4th
create table product(pro_id int,price int check(price>0));

insert into product values(1,50);
insert into product values(1,-50);
-- 5th
create table patient(pat_name varchar(50) not null,
blood_group varchar(20) default 'unknown');

insert into patient(pat_name) values('anitha');
insert into patient(pat_name) values(null);


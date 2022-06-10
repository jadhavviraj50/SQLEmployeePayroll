----------------------------UC1 : To create a payroll service database-------------------------------

CREATE DATABASE payroll_service
use payroll_service;

----------------------------UC2 : To create employee_payroll table-----------------------------------

CREATE TABLE employee_payroll 
(
id INT IDENTITY(1,1) PRIMARY KEY ,
name VARCHAR (150),
salary INT,
startdate DATE,
);

----------------------------UC3 : To create employee_payroll data------------------------------------

insert into employee_payroll values('Viraj',25000,'2022-04-14'),('Vaibhav',60000,'2021-08-15'),('Varad',15000,'2023-04-20'),('Mayuri',15000,'2021-01-18'),('Mitali',10000,'2020-04-10');

----------------------------UC4 : Retrieve all the employee_payroll data-----------------------------

SELECT * FROM employee_payroll;

----------------------------UC5 : Ability to retrieve salary data and start date---------------------

SELECT salary FROM employee_payroll WHERE name = 'Viraj';

SELECT * FROM employee_payroll WHERE startdate BETWEEN CAST('2022-01-01' AS DATE) AND GETDATE();

----------------------------UC6 : Ability to add Gender to employee_payroll table--------------------

ALTER TABLE employee_payroll ADD gender VARCHAR(1);

UPDATE employee_payroll set gender='M' where name = 'Viraj';
UPDATE Employee_Payroll set Gender='M' where name = 'Vaibhav' or name = 'Varad';
UPDATE Employee_Payroll set Gender='F' where name = 'Mayuri' or name = 'Mitali';

----------------------------UC7 : Ability to find sum,average,min,max & count------------------------

SELECT SUM(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
SELECT SUM(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;

SELECT AVG(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
SELECT AVG(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;

SELECT gender, MIN(salary) FROM employee_payroll GROUP BY gender;

SELECT gender, MAX(salary) FROM employee_payroll GROUP BY gender;

SELECT gender, COUNT(name) FROM employee_payroll GROUP BY gender;

----------------------------UC8 : Ability to add employee phone, address, department--------------------

ALTER TABLE employee_payroll ADD phone varchar(10);
UPDATE employee_payroll SET phone='0123456789' WHERE id=3;

ALTER TABLE employee_payroll ADD address varchar(200) not null default 'Panvel';

ALTER TABLE employee_payroll ADD department varchar(100) not null;
UPDATE employee_payroll SET department='Electrical' WHERE name='Viraj';

---------------------------UC9 : Ability to add basic pay, deduction,taxable pay,income tax, net pay-------

ALTER TABLE employee_payroll ADD basicpay int not null default 0;

ALTER TABLE employee_payroll ADD deduction int not null default 0;

ALTER TABLE employee_payroll ADD taxablepay int not null default 0;

ALTER TABLE employee_payroll ADD incometax int not null default 0;

ALTER TABLE employee_payroll ADD netpay int not null default 0;

---------------------------UC10 : Ability to make Terissa----------------------------------------

INSERT INTO employee_payroll(name,salary,startdate,gender,phone,address,department,basicpay,deduction,taxablepay,incometax,netpay) 
Values('Terissa',45000,'2019/03/24','F','0123456789','UK','Sales&Marketing',1000,500,1500,3000,60000);

 
 


---------------------------UC11 : Implement ER Diagram into Payroll Service DB---------------------


create table Company
(compId INT PRIMARY KEY, compName varchar(20));
select * from Company


create table Employee
(empId int PRIMARY KEY,Name varchar(20),compId INT REFERENCES Company(compId) ,Phone varchar(20),Address varchar(200),Gender char);
select* from Employee


create Table Payroll
(empId INT REFERENCES Employee(empId), BasicPay decimal,Deduction decimal, TaxablePay decimal ,IncomeTax decimal,NetPay decimal);
select* from Payroll


CREATE TABLE Department
(DeptName VARCHAR(10),empId INT REFERENCES Employee(empId),deptId int PRIMARY KEY);
select* from Department;





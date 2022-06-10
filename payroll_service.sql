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


INSERT INTO Company VALUES(01, 'Hitachi' );
INSERT INTO Company VALUES(02,'TCS');
INSERT INTO Company VALUES(03,'wipro');
INSERT INTO Company VALUES(04,'Amazon');
SELECT * FROM Company

INSERT INTO Employee VALUES (1, 'Terisa',02,'9897654321','America', 'F');
INSERT INTO Employee VALUES (2, 'Jeck',01,'6785940321','London','M');
INSERT INTO Employee VALUES (3, 'John',03,'8796053412','India','M' );
INSERT INTO Employee VALUES (4, 'Terisa',02,'9897657857','SriLanka', 'F');
SELECT * FROM Employee


INSERT INTO Department VALUES ( 'sales', 1,001);
INSERT INTO Department VALUES ( 'HR',2,002);
INSERT INTO Department VALUES ('Finance',3,003);
INSERT INTO Department VALUES ('Marketing', 4,004);
SELECT * FROM Department


INSERT INTO Payroll VALUES(1, 20000,1000,400,700,19000);
INSERT INTO Payroll VALUES(2,30000,1200,400,700,28800);
INSERT INTO Payroll VALUES(3,40000,2000,400,700,38000);
INSERT INTO Payroll VALUES(4,35000,1000,400,700,34000);
SELECT * FROM Payroll


UC12:  retrieve queries done especially in UC 4, UC 5 and UC 7 are working with new table structure

---------------------------------UC4: To retrieve all  data-------------------------------------------------


SELECT  e.Name, d.DeptName, c.compName, p.BasicPay,p.NetPay,e.Gender,e.Address,e.Phone
FROM Employee e
INNER JOIN Department d
ON e.empId=d.empId
INNER JOIN Company c
ON c.compId=e.compId
INNER JOIN payroll p
ON p.empId=e.empId;

---------------------------------UC5: Ability to retrieve salary data by name------------------------------

SELECT  e.Name,p.BasicPay
FROM Employee e
INNER JOIN Department d
ON e.empId=d.empId
INNER JOIN Company c
ON c.compId=e.compId
INNER JOIN payroll p
ON p.empId=e.empId
where Name='jeck';

---------------------------------employees join between this range of date----------------------------------

ALTER TABLE Employee ADD Start_Date DATE;
UPDATE Employee SET Start_Date='2020-05-15' WHERE empId = 3;

SELECT  e.Name,e.Start_Date
FROM Employee e
INNER JOIN Department d
ON e.empId=d.empId
INNER JOIN Company c
ON c.compId=e.compId
INNER JOIN payroll p
ON p.empId=e.empId
WHERE Start_Date BETWEEN CAST('2018-01-01'AS DATE) AND GETDATE();


----------------------------------UC7:Ability to find sum,average,min,max & count-----------------------------

SELECT sum(BasicPay)as p
FROM Employee e
INNER JOIN Department d
ON e.empId=d.empId
INNER JOIN Company c
ON c.compId=e.compId
INNER JOIN payroll p
ON p.empId=e.empId
WHERE Gender= 'F' GROUP BY Gender;

SELECT Max(BasicPay)as p
FROM Employee e
INNER JOIN Department d
ON e.empId=d.empId
INNER JOIN Company c
ON c.compId=e.compId
INNER JOIN payroll p
ON p.empId=e.empId
WHERE Gender= 'M' GROUP BY Gender;

SELECT Avg(BasicPay)as p
FROM employee e
INNER JOIN DEPARTMENT d
ON e.empId=d.empId
INNER JOIN Company c
ON c.compId=e.compId
INNER JOIN payroll p
ON p.empId=e.empId
WHERE Gender= 'F' GROUP BY Gender;

SELECT Min(BasicPay)as p
FROM employee e
INNER JOIN DEPARTMENT d
ON e.empId=d.empId
INNER JOIN Company c
ON c.compId=e.compId
INNER JOIN payroll p
ON p.empId=e.empId
WHERE Gender= 'F' GROUP BY Gender;

SELECT Count(BasicPay)as p
FROM employee e
INNER JOIN DEPARTMENT d
ON e.empId=d.empId
INNER JOIN Company c
ON c.compId=e.compId
INNER JOIN payroll p
ON p.empId=e.empId
WHERE Gender= 'M' GROUP BY Gender;


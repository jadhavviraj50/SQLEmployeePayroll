UC1 : To create a payroll service database

CREATE DATABASE payroll_service
use payroll_service;

UC2 : To create employee_payroll table

CREATE TABLE employee_payroll 
(
id INT IDENTITY(1,1) PRIMARY KEY ,
name VARCHAR (150),
salary INT,
startdate DATE,
);

UC3 : To create employee_payroll data

insert into employee_payroll values('Viraj',25000,'2022-04-14'),('Vaibhav',60000,'2021-08-15'),('Varad',15000,'2023-04-20'),('Mayuri',15000,'2021-01-18'),('Mitali',10000,'2020-04-10');

UC4 : Retrieve all the employee_payroll data

SELECT * FROM employee_payroll;

UC5 : Ability to retrieve salary data and start date

SELECT salary FROM employee_payroll WHERE name = 'Viraj';

SELECT * FROM employee_payroll WHERE startdate BETWEEN CAST('2022-01-01' AS DATE) AND GETDATE();

UC6 : Ability to add Gender to employee_payroll table

ALTER TABLE employee_payroll ADD gender VARCHAR(1);

UPDATE employee_payroll set gender='M' where name = 'Viraj';
UPDATE Employee_Payroll set Gender='M' where name = 'Vaibhav' or name = 'Varad';
UPDATE Employee_Payroll set Gender='F' where name = 'Mayuri' or name = 'Mitali';

UC7 : Ability to find sum,average,min,max & count

SELECT SUM(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
SELECT SUM(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;

SELECT AVG(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
SELECT AVG(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;

SELECT gender, MIN(salary) FROM employee_payroll GROUP BY gender;

SELECT gender, MAX(salary) FROM employee_payroll GROUP BY gender;

SELECT gender, COUNT(name) FROM employee_payroll GROUP BY gender;

UC8 : Ability to add employee phone, address, department

ALTER TABLE employee_payroll ADD phone varchar(10);
UPDATE employee_payroll SET phone='0123456789' WHERE id=3;

ALTER TABLE employee_payroll ADD address varchar(200) not null default 'Panvel';

ALTER TABLE employee_payroll ADD department varchar(100);
UPDATE employee_payroll SET department='Electrical' WHERE name='Viraj';












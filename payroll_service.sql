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

UC3 : To create employee payroll data

insert into employee_payroll values('Viraj',25000,'2022-04-14'),('Vaibhav',60000,'2021-08-15'),('Varad',15000,'2023-04-20');







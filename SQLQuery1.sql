use master
use COMPANY
----------------1-------------------
CREATE DATABASE COMPANY
ON (
NAME = 'COMPANY',
filename='D:\db\COMPANY_DATA.mdf',
SIZE=10MB,
MAXSIZE=50MB,
FILEGROWTH=10MB

)
LOG ON (
	NAME='COMPANY_log' ,
	FILENAME='D:\db\COMPANY_log.ldf' ,
	SIZE=5MB ,
	MAXSIZE=40MB,
	FILEGROWTH=10MB
	);
----------------------<2>------------------------------	
	CREATE TABLE departments(
	id int  PRIMARY KEY
	);

	CREATE TABLE employee(
    EMP_no int identity(1,1),
	FirstName varchar(255) not null,
    LastName varchar(255)not null,
    --Address varchar(255),
    --City varchar(255),
	dept_no int,
	salary int  check(salary<6000),check(salary>600),


	 PRIMARY KEY (EMP_no),
	 fOREIGN KEY (dept_no) references departments(id)
	 


);
insert into COMPANY.departments(id)values(8)
insert into COMPANY.departments(id)values(6)
insert into COMPANY.departments(id)values(20)


insert into COMPANY.employee(FirstName,LastName,dept_no,salary)values('sabah','seraj',5,4500)
insert into COMPANY.employee(FirstName,LastName,dept_no,salary)values('sara','sam',10,4000)
insert into COMPANY.employee(FirstName,LastName,dept_no,salary)values('mora','so',11,900)
insert into COMPANY.employee(FirstName,LastName,dept_no,salary)values('soso','mo',11,900)
insert into COMPANY.employee(FirstName,LastName,dept_no,salary)values('sso','meo',11,900)


--drop DATABASE COMPANY

select * from employee

CREATE TABLE project(
    project_no int identity(1,1),
	project_Name varchar(255)unique not null,
	budget bigint null,
	 PRIMARY KEY (project_no)
	 --fOREIGN KEY (dept_no) references departments(id)

);
create table Works_on(
 EMP_no int  not null,
  
 project_no int not null,

 job varchar(255)null, 
 enter_date datetime not null 
 PRIMARY KEY (EMP_no,project_no)
 );

insert into COMPANY.departments(id)values(3)
insert into COMPANY.departments(id)values(7)
insert into COMPANY.departments(id)values(30)

insert into dbo.project(project_Name,budget)values('Apolloe',120000)
insert into dbo.project(project_Name,budget)values('geminie',95000)
insert into dbo.project(project_Name,budget)values('mercurye',185600)
insert into dbo.project(project_Name,budget)values('mercuye',null)

insert into dbo.Works_on(EMP_no,project_no,job,enter_date)values(5,9,'mercur',2022/3/4)
insert into dbo.Works_on(EMP_no,project_no,job,enter_date)values(1,1,'mercur',2022/3/4)
insert into dbo.Works_on(EMP_no,project_no,job,enter_date)values(1,9,'mer',2022/3/4)
insert into dbo.Works_on(EMP_no,project_no,job,enter_date)values(4,10,'mercur',2022/3/4)

select * from employee
select * from project
 select * from Works_on





--- drop TABLE employee
--- drop TABLE project
--- drop TABLE Works_on
----------3-------------------------------------------
  alter table employee add TelephoneNumber bigint
  alter table employee drop column TelephoneNumber

  --------4---------------------------------------------
--  drop TABLE department
 --   drop schema Company

 --create schema Company
 --CREATE TABLE Company.Company. department(
--	id int  PRIMARY KEY
--	);
alter schema Company transfer dbo.departments
alter schema Company transfer dbo.Employee

 select SCHEMA_NAME (SCHEMA_ID),name from sys.tables
 ----------6--------------------------

insert into COMPANY.employee(FirstName,LastName,dept_no,salary)values('mora','so',11,900)
insert into COMPANY.employee(FirstName,LastName,dept_no,salary)values('soso','mo',11,900)
insert into COMPANY.employee(FirstName,LastName,dept_no,salary)values('sso','meo',11,900)


insert into dbo.project(project_Name,budget)values('gemini',95000)
insert into dbo.project(project_Name,budget)values('mercury',185600)
insert into dbo.project(project_Name,budget)values('mercuy',null)


insert into dbo.Works_on(EMP_no,project_no,job,enter_date)values(1,1,'mercury',2022/3/4)
insert into dbo.Works_on(EMP_no,project_no,job,enter_date)values(1,9,'merc',2022/3/4)
insert into dbo.Works_on(EMP_no,project_no,job,enter_date)values(4,10,'mercury',2022/3/4)

 select * from Company.employee

 ---------------------------------------
--insert into dbo.Works_on(EMP_no,project_no,job,enter_date)values(11111,10,'mercury',2022/3/4)
--alter 
--UPDATE employees 
--SET 
--    address = '1300 Carter St',
 --   city = 'San Jose',
 ---   postalcode = 95125,
 --   region = 'CA'
--WHERE
  --  employeeID = 3;
  ----------(Bonus)------------
  select EMP_no,
        firstName,
		lastName,
		dept_no,
		salary
		from  Company.employee
		where emp_no=1
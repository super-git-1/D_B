use ITI
select * from Course
select * from Department
select * from Instructor
select * from Stud_Course
select * from Student
select * from Topic
-----------------------------------------------
CREATE INDEX index_s_c ON Stud_Course(Crs_id);
select * from Stud_Course
----------------------------------------------- 
CREATE table new_emp (
id int identity(1,1) primary key ,
f_name varchar (20) ,
l_name varchar (20),
salary  bigint
)
drop table new_emp
----------------------------------------------
select * from new_emp
go
insert into NewEmp(f_name,l_name,salary)values('sabah','serag',20000)
insert into NewEmp(f_name,l_name,salary)values('han','soig',20000)
insert into NewEmp(f_name,l_name,salary)values('lona','fogy',20087)

CREATE table NewEmp (
id int identity(1,1) primary key ,
f_name varchar (20) ,
l_name varchar (20),
salary  bigint
)
drop table NewEmp
CREATE CLUSTERED INDEX N_EMP ON NewEmp(id)
select * from NewEmp
CREATE CLUSTERED INDEX s_EMP ON NewEmp(salary)
--------------------------------------------------------------
use COMPANY
select * from company.employee
CREATE nonCLUSTERED INDEX Name_EMP ON company.employee(FirstName)
select * from project

--------------- 2->a -----------------------------------------------
with CTE_emp_dept (EMP_no,FirstName,LastName,dept_no,salary)
as(
select e.EMP_no,e.FirstName,e.LastName,e.dept_no,e.salary
from company.employee e
)
select dept_no, count(EMP_no)as EMP_NO from company.employee
group by (dept_no)
--------------- 2->b ----------------------------------------------
select *from project
select *from Works_on

with CTE_emp_project (EMP_no,project_no,jop)
as(
select EMP_no,project_no,job
from Works_on 
)
select project_no, count(EMP_no)as EMP_NO from CTE_emp_project
group by (project_no)
----------------2->c---------------------------------------------
with CTE_emp_budget (project_Name,budget)
as(
select project_Name,budget
from project 
)
select top 10 project_Name, budget as highest_budget from CTE_emp_budget
order by budget DESC
select *from project
---------------2->d-------------------------------------------------

--with CTE_emp_salary (EMP_no,FirstName,LastName,dept_no,salary)
--as(
--select EMP_no,FirstName,LastName,dept_no,salary
--from company.employee 
--)
--select company.employee.EMP_no, count(salary)as salarys from company.employee
--group by (dept_no)

--.............---...........---..........-----..................---........---.

select * from company.employee

with CTE_emp_sal (EMP_no,firstName,lastname ,salary)
as(
select EMP_no,firstName,lastname,salary
from company.employee 
)
select salary , count(EMP_no)as EMP_NO from CTE_emp_sal 
group by (salary)
order by salary DESC

----------------<3>---------------------------------------------
backup database company to disk='D:\db.bak'
----------------<3>--------------------------
CREATE DATABASE [BackupExpiryTest];
GO
BACKUP DATABASE company
TO DISK = N'D:\db.bak'
WITH EXPIREDATE = N'2022-06-9 00:00:00';
GO
DROP DATABASE company;
GO
RESTORE DATABASE company
FROM DISK = N'D:\db.bak';
GO






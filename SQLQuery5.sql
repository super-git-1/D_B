use COMPANY
--select * from COMPANY.Department
select * from COMPANY. departments
select * from COMPANY.employee
------------<1>---------------------------
go
begin try
insert into COMPANY. employee ( FirstName,LastName,dept_no,salary)values('eueu','eiei',7,5000)
end try 
begin catch
print
 'we have error'
end catch
go
alter table project 
add isDeleted bit default 'false'
alter table project
drop column isDeleted
select project_no from project
go
------------------<2->a+b>---------------------------------
create or alter trigger tr_SOftDelet_From_project 
on project 
instead of delete 
as
begin 
declare @id int
select @id=project_no from deleted
update project 
set isDeleted=1
where project_no=@id 
end

delete project where project_no =2
select * from project

---------<2->c>--------------------------------------
go
create view vActiveProjects  select * from project
where  isDeleted=0

---------<2->d>--------------------------------------
delete from project
where project_no= 7

--------<2->e>---------------------------------------
Select project_no,project_Name,budget from project
--------<3>------------------------------------------
create table BudgetChangeAudit
(
id int identity primary key,
project_no varchar(5),
userName varchar(150),
ModifiedDate date,
Budget_Old int,
Budget_New int
)
--drop table BudgetChangeAudit
select * from BudgetChangeAudit
go
create or alter trigger tr_budget_update
on project 
for update 
as
begin 
if UPDATE(budget)
begin 
insert into BudgetChangeAudit (project_no,userName,ModifiedDate,Budget_Old,Budget_New)values
--('p1','sabah',)
((select project_no from inserted)
,suser_name (),
getdate(),
(select budget from deleted),
(select budget from inserted ))
end 
end
--alter table project 
update project
set budget = 200000
where project_no = 1
select*from BudgetChangeAudit
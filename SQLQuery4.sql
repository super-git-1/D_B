use iti

-----------------------<1>------------------------------------------------
 Create or alter FUNCTION fn_Ff2(@f2 int,@f3 int )
 returns @result table(
 id int
 
 )
 as 
 begin 
 while @f2< @f3 
 begin 
 insert into @result values (@f2)
 set @f2 +=1
 end
 return
 end
 select * from fn_Ff2(1,9)
 -----------------------<2>--------------------
 use COMPANY
 select * from Company.employee

  Create or alter FUNCTION emp(@id int )
  returns table 
  as 
  return select FirstName+' '+LastName as full_name,title,m_status,gender  
  from Company.employee
  where @id=EMP_no
  go
  select * from emp(11)

  go

   
   
   select FirstName+' '+LastName as full_name,title 
-- ,case 
-- when title like 'null' then 'Not provided'
-- end as title
/*
begin 
if title is null 
begin 
return print 'Not provided'
end
end
go*/
 ,case
 when m_status like 's'then 'single'
 when m_status like 'm' then 'married'
 end as m_status
 ,case
 when gender like 'fem' then 'female'
 when gender like 'm' then 'male'
 end as gender 
from Company.employee
select * from Company.employee

----------------<3>--------------------------



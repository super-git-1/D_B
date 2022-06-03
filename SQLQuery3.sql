use World
select * from City 
select * from Country 
select * from CountryLanguage
-----------<1>---------------------------
select  Name  , language
from Country , CountryLanguage
where code=Countrycode and IsOfficial=1


--select Name from City where District = District
-----------<2>---------------------------
SELECT District,  COUNT(Name) as city  
	FROM City 
		GROUP BY  District
		order by COUNT(Name) DESC 

		select Name as City_name,District from City where District='Guerrero '
		select Name as City_name,District from City where District='Sichuan  '

-----------------------------------------
           
go
--create or alter view same_District
--as
--select s.Name as cities_Name ,c.District
--from City s full join City c  
--on s.Name=c.District 
--select * from same_District
------------------------------
--select Name,District from City where District ='Buenos Aires' 
--union
--select Name,District from City where District = 'Queensland'
--union
--select Name,District from City where District = 'S?o Paulo'
go
------------<3>--------------------------with null value		
select c.Code,c.Name as Country_name,COUNT(s.Name)as city_numbur
from Country c full join City s
on   c.Continent like 'Africa'and s.CountryCode=c.Code 
GROUP BY c.Code, c.Name
order by city_numbur DESC
select * from City where CountryCode ='cod'
select * from City where CountryCode ='nga'


------------<3>--------------------------without null value	
create view AfricanCountries_cities_number
as
select c.Code,c.Name as Country_name,COUNT(s.Name)as city_numbur
from Country c full join City s
on   c.Continent like 'Africa'and s.CountryCode=c.Code 
GROUP BY c.Code, c.Name
--order by city_numbur DESC

select * from AfricanCountries_cities_number 
where Code is not null
order by city_numbur DESC

------test-------
select * from City where CountryCode ='cod'
select * from City where CountryCode ='nga'
-----------<4>------------------------------
select  Name  , count(language)
from Country , CountryLanguage
where code=Countrycode and IsOfficial=0
group by Name


-----------<5>------------------------------

--select  Name  , count(language)as Official
--from Country , CountryLanguage
--where code=Countrycode and IsOfficial=1 
--group by Name
--order by Official DESC
go
create view Official_is_more_then_one
as
select  Name  , count(language)as Official
from Country , CountryLanguage
where code=Countrycode and IsOfficial=1 
group by Name
--order by Official DESC

select * from Official_is_more_then_one 
where Official>1 
order by Official DESC


--------------<6>-------------------------
select Code,Code2,Name,LifeExpectancy from Country

select name,LifeExpectancy from Country
where LifeExpectancy is not null
order by LifeExpectancy ASC


---------------<7>------------------------
create view population_more_then_100Million
as
select c.Code,c.Name as Country_name,COUNT(s.Name)as city_numbur,c.Population
from Country c full join City s
on s.CountryCode=c.Code and c.Population>100000000
GROUP BY c.Code, c.Name,c.Population
--drop view population_more_then_100Million

select * from population_more_then_100Million
where city_numbur>0 and Code is not null 
order by Population DESC


-----------<8>--------------------------
create view highest_city_population
as
select  c.Code,c.Name as country_name, s.Name as city_name, s.Population
from Country c full join City s
on s.CountryCode=c.Code 
GROUP BY c.Code, c.Name,s.Name,s.Population

select *  from highest_city_population
order by Population DESC





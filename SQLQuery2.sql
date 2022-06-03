use World
----------
select * from city
select * from Country
select * from CountryLanguage

--select * from Country
--where Population in(
--select top(1) with [name] from City 
--
--)


-------------8--------------
select * from CountryLanguage
where Language like 'Dutch'
--1--------------------------

select * from Country
--2-------------------
select distinct language  from CountryLanguage 
--3---------------------------------------------
select * from Country
where Continent ='Africa'
--4-----------------------------------
select * from City
where Population > '2000000'
--5---------------------------
select * from Country
where IndepYear between 1920 and 1990
--6------------------------------------
select * from Country
where IndepYear is not null
--7-------------------------------------
select * from Country
where GovernmentForm like 'Republic'
--8-------------------------------------
select * from Country
where Continent = 'Asia' and Population>'100000000'
--9-------------------------------------------------
select CountryCode from CountryLanguage
where Language='spanish' and IsOfficial='1'
--10--------------------------------------------------
select CountryCode , count(*)from CountryLanguage
group by CountryCode  
having CountryCode>'1'
--11-------------------------------------
select sum(convert(float,population)) as 'all'
from Country
--12--------------------------------------------
select Continent,COUNT(*)as 'Continents',sum(convert(float,population))as 'population'from Country
group by Continent
--13--------------------------------------------------------------------------------------------------
select Name from City
where CountryCode=(select code from Country where name = 'egypt')
--14-----------------------------------------------------------------------------
select * from Country 
where Code in (select countrycode from City where Population>'5000000')

select Name from Country 
where Code in (select countrycode from City where Population>'5000000')
--15----------------------------------------------------------------------------
select Name from Country
where Code in (select CountryCode from CountryLanguage 
where Language = 'Dutch' and IsOfficial=0)
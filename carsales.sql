use sales;-- calling for database
go
select * from car; -- calling table car
select * from car where Make='BMW';-- calling for on;y car with value bmw
select* from car where Year in ('2011','2013'); -- calling for car year between to values
select * from car where Make not in ('BMW','Ford');-- calling for every car except bmw and ford
select * from car where [Number of Doors] between 2 and 3; -- calling for car with 2 or 3 doors
select distinct make from car; -- calling for only unique name of make
select make,model, popularity from car; -- calling only 3 columns
select distinct make, model from car; 
select * from car where make like 'M%'; -- calling for car that make start with m
select * from car where make like '%a'; -- calling for car that make ends with a  
select * from car where make not like 'B%'; -- calling for car expect whos starting with B
select * from car where model like 'S___';-- every tail _ represent one letter
select * from car where make like '[AE]%'; -- start with a or e 
select * from car where make like '[A-D]%';-- start with a or d
select make, model, year from car order by make; -- order by ascend in make name
select make, model, year from car order by year desc; -- order by descende in year column
select make, model, year from car order by make, year desc; --- more propre
select * from book1;
-- i am going to join table car with table book1 which have a price of cars
select make, model, year, carname as [ car name], [price"] as price from car, book1 where car.make = book1.carname;
-- other methode more preferable 
select make, model, year, carname as [ car name], [price"] as price from car join book1 on car.make =  book1.carname; 
--inner join 
select make, model, year, carname as [ car name], [price"] as price from car inner join book1 on car.make =  book1.carname; 
-- outer join full first table join a part of table 2
select make, model, year, carname as [ car name], [price"] as price from car full outer join book1 on car.make =  book1.carname; 
--left outer join
select make, model, year, carname as [ car name], [price"] as price from car left outer join book1 on car.make =  book1.carname;
-- right outer join
select make, model, year, carname as [ car name], [price"] as price from car right outer join book1 on car.make =  book1.carname; 
-- stastics 
select max([price"]) as 'highest Price', min([price"]) as 'Lowest price', avg([price"]) as average, sum([price"]) as 'total prices',
count (*) as 'no of products' from book1 group by carname;-- here aliens key is more then one words so add 'more then 1' 
-- calculer max from column and groupe it each car by name then apply calculation 
select max([price"]) as 'highest Price', min([price"]) as 'Lowest price', avg([price"]) as average, sum([price"]) as 'total prices',
count (*) as 'no of products' from book1 group by carname having count(*)<10000;--realizing filtre with conditions 
-- view to limit acces for user specially for confidentiality save query
create view vcar as select make, model, year, carname, [price"] as price from car as c join book1 as b 
on c.make=b.carname;
select * from vcar order by year desc;

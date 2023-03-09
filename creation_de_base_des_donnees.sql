use sales;
GO
create schema production;
GO
create table production.customers
(
customer_id int not null, 
first_name Varchar(50) not null,
last_name varchar(50) not null,
email varchar(50) not null,
phone int,
state varchar(15),
city varchar(15) not null,
street varchar(50) not null,
zip_code varchar(5) 

constraint customers_pk primary key (customer_id) 
);
create table production.categories
(category_id int not null primary key,-- other way to declarete primary key directly but preference to use constraint
 category_name varchar(20)
);
create table production.brands 
(brand_id int,
brand_name varchar(20),

constraint brands_pk primary key(brand_id) -- constraint name_cons primary key (name_key)
)
create sales_schema;
go
create table sales_schema.customers
(
customer_id int not null,
first_name Varchar(50) not null,
last_name varchar(50) not null,
email varchar(50) not null,
phone varchar(15),
state varchar(15),
city varchar(15) not null,
street varchar(50) not null,
zip_code varchar(5),
salary numeric(7,2) check (salary between 4000 and 15000),
hire_date date,

constraint customers_pk primary key (customer_id),
constraint customers_uq unique(phone) -- to clear it unique value
); 
create table sales_schema.store
(store_id int primary key,
store_name varchar(30),
city varchar(30) not null,
phone varchar(10)
)
create table sales.schema_staff
(staff_id int primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
salary numeric(7,2),
hire_date date,
store_id int, 
constraint store_staff_fk foreign key(store_id) references store (store_id) -- foreing key to call value from out side the table
-- constraint name_of foreign key (name_inside) references table_out_where_foreign_existe(forgein_key_name)
);
create table sales_schema.orders
(order_id int primary key,
order_date date,
order_status varchar(10),
order_type varchar(10),
constraint customer_no int references sales_schema.customers(customer_id)
)
alter table sales_schema.store -- to add modification to existence table
add street varchar(20); -- add 
alter table store -- add new values
add zip_code int,
fax varchar(23);
alter table store
alter column store_name varchar(50);
alter table store
alter column city varchar(30) null;
alter table store --add new propriete unique to querie
add constraint store_name_uq unique(store_name);
create table products(
product_id int not null, 
product_name varchar(20),
model int,
brand_id int);
alter table products 
add constraint product_pk primary key(product_id);
alter table products
add constraint product_fg foreign key (brand_id) references store (store_id); 
alter table store
drop constraint store_name_uq;
EXEC sp_rename 'staff', 'workers'; -- to change name of table
EXEC sp_rename 'store', 'stores'; -- change name of existence table
create table customers 
(
customer_id int primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
phone varchar(15),
email varchar(30) not null,
city varchar(10) check(city in ('tetouan','tanger','fes')),
zipcode int
);
drop table orders;
create table orders(
order_id int identity(1,1),

customer_id int,
order_status tinyint not null,
order_date date not null,
required_date date not null,
shipped_date date,
store_id int not null,
staff_id int not null,
constraint order_pk primary key (order_id),
constraint customers_id_or foreign key (customer_id) references customers(customer_id),
constraint store_id_or foreign key (store_id) references stores(store_id)
);
insert into production.customers(customer_id,first_name, last_name, email, city, street) -- add value to table
values (1,'hatim','hat','emha','tanger','hats');
insert into production.customers(customer_id,first_name,last_name, email,phone,city,street)
values (2,'hatim','benjebara','hatim@gmail.com','0000','tetouan','hat2');
insert into production.customers(customer_id,first_name,last_name,email,phone,city,street)
values (3,'karim','abdo','email1','0022','fes','camara'), 
	   (4,'kaim','abd','email2','0023','tetouan','ana');
select * from production.customers; -- affichage de tableau
insert into stores(store_id,store_name,city,phone)
output inserted.store_id,inserted.store_name -- affichage des colonnes 
values 
(1,'ha','tetouan','0000'),
(2,'ha','tetouan','0000');
update production.customers -- to correct existence value in existence table
set email= 'emha@gmail.com' 
where customer_id=1;
update stores set city= 'tanger', phone='05239438',store_name='net boutique' where store_id =1;
select * from stores; /* l 'utilisation basique de requete SQL SELECT nom_du_champ FROM nom_du_tableau va selectionner SELECT le champ nom_du_champ provenant 
FROM nom_du_tableau */

delete from stores where store_id=2;
delete from production.customers where customer_id between 3 and 9;
select city from production.customers;

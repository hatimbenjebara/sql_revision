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
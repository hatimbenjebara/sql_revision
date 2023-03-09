create table production.categories
(category_id int not null primary key,-- other way to declarete primary key directly but preference to use constraint
 category_name varchar(20)
);
create table brands 
(brand_id int,
brand_name varchar(20),

constraint brands_pk primary key(brand_id) -- constraint name_cons primary key (name_key)
)
alter table sales_schema.store 
add street varchar(20); -- add new column 
alter table sales_schema.store -- add multiple columns 
add zip_code int,
fax varchar(23);
alter table sales_schema.store
alter column store_name varchar(50);
alter table store
alter column city varchar(30) null;
alter table store --add new propriete unique to querie
add constraint store_name_uq unique(store_name);
alter table products 
add constraint product_pk primary key(product_id);
alter table products
add constraint product_fg foreign key (brand_id) references store (store_id); 
alter table store
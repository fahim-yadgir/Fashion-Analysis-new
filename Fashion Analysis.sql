create database Fashion_db;
use Fashion_db;

drop table ecommerce_clothing_dataset;

select * from customer_purchase_dataset;

select avg(`Customer Rating`)
from customer_purchase_dataset;

SET SQL_SAFE_UPDATES = 0;

update customer_purchase_dataset
set `Customer Rating` = 3
where `Customer Rating` = 3.22;


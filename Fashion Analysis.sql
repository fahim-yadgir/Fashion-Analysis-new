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

select *,
case 
when `Unit Selling Price` < 400 then 'low'
when `Unit Selling Price` between 400 and 500 then 'medium'
when `Unit Selling Price` > 500 then 'high'
end segment
from customer_purchase_dataset;

select `Product Name` ,brand,`Shopping App`,`Unit Selling Price`,`Payment Method`
from customer_purchase_dataset
where `Unit Selling Price` = (select max(`Unit Selling Price`)from customer_purchase_dataset);

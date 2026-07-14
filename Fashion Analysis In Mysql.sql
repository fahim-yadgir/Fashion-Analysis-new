create database Fashion_db;
use Fashion_db;

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

select `Customer Name`,round(sum(`Total Amount Paid`),2)as Total_Amount_Paid,count(*)as More_than_1
from customer_purchase_dataset
group by `Customer Name`
having count(*)>1;

select brand,round(sum(`Total Amount Paid`),2)total_revenue
from customer_purchase_dataset
group by brand;

select * from 
(select `Payment Method` ,`Total Amount Paid`,dense_rank() over(partition by `Payment Method` order by `Total Amount Paid` desc)as top_3
from customer_purchase_dataset
)as category
where top_3 <=3
order by  `Payment Method`,top_3;

select * from 
(
select `Customer Name`,`Payment Method`,`Unit Selling Price`,`Order Status`,
dense_rank() over(partition by `Order Status` order by `Unit Selling Price` desc)as top_3
from customer_purchase_dataset
)as category
where top_3 <= 3
order by `Order Status`,top_3;

select `Customer Name`,`Product Name`,Brand,`Quantity`,`Unit Selling Price`,`Total Amount Paid`,`Purchase Date`
from customer_purchase_dataset
where `Purchase Date` between '2025-01-01' and '2025-01-31'
order by `Total Amount Paid` desc;

update customer_purchase_dataset
set 
`Purchase Date` = str_to_date(`Purchase Date`,'%d-%m-%Y');

select `Customer Name`,`Product Name`,Brand,max(Quantity)as quantity
from customer_purchase_dataset
group by `Customer Name`,`Product Name`,Brand
order by quantity desc
limit 1;

select `Customer Name` ,count(*)as total_count,round(sum(`Total Amount Paid`),2)as total_amount
from customer_purchase_dataset
group by `Customer Name`
having count(*)>1
order by total_amount desc;

select min(`Total Amount Paid`),max(`Total Amount Paid`),avg(`Total Amount Paid`)
from customer_purchase_dataset;

select *,
round(sum(`Total Amount Paid`) over(order by `Customer ID`),2)as Cumulative_sum
from customer_purchase_dataset;

select `Customer Name`,age,gender,`Product name`,`Total Amount Paid`
from customer_purchase_dataset
where gender = 'Female' and age between 0 and 18;

select Brand,round(sum(`Total Amount Paid`),2)as total_amount_paid
from customer_purchase_dataset
group by brand
order by total_amount_paid desc
limit 10;

select brand,avg(`Total Amount Paid`)as Average_Amount
from customer_purchase_dataset
group by brand;

select brand , round(sum(`Unit Selling Price`),2)as Total_sales,round(sum(Quantity),2)as total_quantity,round(avg(`Customer Rating`),2)as avg_customer_rating
from customer_purchase_dataset
group by brand
order by Total_sales desc;

select City,avg(`Unit Selling Price`)
from customer_purchase_dataset
group by city
having avg(`Unit Selling Price`) > 700;

select `Payment Method`,max(`Total Amount Paid`)as high_payment_amount
from customer_purchase_dataset
group by `Payment Method`
order by high_payment_amount desc
limit 1;

select `Product Name`,max(Quantity)as highest_quantity
from customer_purchase_dataset
group by `Product Name`
order by highest_quantity desc
limit 1;

select `Customer Name`,count(*)as total_count
from customer_purchase_dataset
group by `Customer Name`
having count(*) >= 5;

select month(`Purchase Date`)as months,round(sum(`Total Amount Paid`),2)as monthly_Sales
from customer_purchase_dataset
group by month(`Purchase Date`)
order by months;

select `Shopping App` , round(sum(`Total Amount Paid`),2)as highest_seling_app
from customer_purchase_dataset
group by `Shopping App`
order by highest_seling_app desc 
limit 1;

select `Customer ID`,`Customer Name`,`Total Amount Paid`,
rank() over(partition by `Customer Name` order by `Total Amount Paid`)as spending_money_rank
from customer_purchase_dataset;

select * ,
dense_rank() over(partition by `Product Name` order by `Total Amount Paid`)as Top_3_highest_selling
from customer_purchase_dataset;

select `Order Status` ,round(avg(`Customer Rating`),2)as avg_customer_rating
from customer_purchase_dataset
group by `Order Status`
having avg(`Customer Rating`) > 3;

create view Mumbai_info as
select * ,
round(sum(`Total Amount Paid`) over(order by `Customer ID`),2)
from customer_purchase_dataset
where city = 'Mumbai';

drop view Mumbai_info;

select * from Mumbai_info;

create view Pune_info as
select * ,
round(sum(`Total Amount Paid`) over(order by `Customer ID`),2)
from customer_purchase_dataset
where city = 'Pune';

select * from Pune_info;

select age,sum(`Total Amount Paid`)as max_revenue
from customer_purchase_dataset
group by age
order by max_revenue desc
-- limit 1;
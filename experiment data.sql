create table experiment_data
select * from customer_purchase_dataset;

drop table experiment_data;

delimiter $$
create procedure Update_Quantity
(
in cust_id varchar(100),
in Quant int
)
begin
update experiment_data
set Quantity = Quant,
	`Total Amount Paid` = Quantity * `Unit Selling Price`
where `Customer ID` = cust_id;
select * from experiment_data;
end $$

drop procedure Update_Quantity;

call Update_Quantity('CUST00001',2);
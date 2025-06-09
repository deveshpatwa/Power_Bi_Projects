create database salesdata;
use salesdata;
select * from product;
describe  product;

update product 
set cost = cast(replace(cost,",","") as decimal);

select * from product;

update product
set taxes = round(taxes,1);
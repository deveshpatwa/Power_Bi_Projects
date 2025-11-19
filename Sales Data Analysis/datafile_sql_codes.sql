create database salesdata;
use salesdata;


-- Data cleaning task (check all column and clean the data

select * from product;

alter table product
rename column cost  to  prod_cost;

select 1
from product;


drop database db2;

commit;

start transaction;

create database db2;
use db2;
create table emp( 
name varchar(30),
salary int);

commit;
select * from emp;


insert into emp values("ravi",3000);

select * from emp;


start transaction;


insert into emp values ("kunal",5000);

select * from emp;

rollback;

select * from emp;

start transaction;

insert into emp values("i want this",999);

select * from emp;

savepoint first_sp;

insert into emp values("i dont want this",0);

select * from emp;
rollback to savepoint first_sp;
select * from emp;
commit;

select * from emp;

select *
from emp
where salary < 2000;
alter database db2 upgrade db9;

mysqldump;

show databases;

use db2;
show tables;

select * from emp;

create table orders(
	order_id int primary key auto_increment,
    product_name varchar(100) not null,
    sales double,
    qty smallint
    );
    
select * from orders;

alter table orders
drop column product_name;

alter table orders
add column product_id int;

select * from orders;

describe orders;


create table orders(
	order_id int primary key auto_increment,
    product_id int,
    sales double,
    qty smallint,
    foreign key (product_id) references product(product_id)
    );


create table product(
product_id int primary key ,
product_name varchar(100));


select * from orders;
select * from product;

select * from product;
insert into product 
values (101,"table"),
		(102,"mobile");
        
select * from product;

select * from orders;

describe orders;

insert into orders(product_id,sales,qty)
values (101,200,3);

select * from orders;

insert into orders(product_id,sales,qty)
values (102,400,6);


select sum(sales)
from orders;

select product_id,sum(sales) as total_sales
from orders
group by product_id;

select p.product_name, sum(o.sales) as totoal_sales
from orders as o
join product as p
on o.product_id = p.product_id
group by p.product_name
having p.product_name = "table";

select * from product;


select * from store;


select category,sale, sum(sale) over() as ts
from store;


select order_date, category , sum(sale) over(partition by category order by order_date)
from store;



select * from store;

with temp as (
select id,sub_category, profit,rank() over(partition by sub_category order by profit desc) as rk
from store)
select * from temp
where rk =1;
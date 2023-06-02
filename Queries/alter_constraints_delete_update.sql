--create a new table 
--drop table dbo.amazon_orders; 

create table dbo.amazon_orders
(
order_id varchar(25) ,
customer_id integer,
customer_name varchar(200),
product_name varchar(200),
order_date date,
cost decimal(6,3),
address varchar(1000),
payment_mode varchar(50),
delivery_date datetime
);


alter table amazon_orders 
add ship_date date 

alter table amazon_orders 
drop column ship_date 

alter table amazon_orders
alter column order_date datetime

alter table amazon_orders
alter column product_name date

alter table amazon_orders
alter column order_date date

alter table amazon_orders
alter column product_name varchar(250);

insert into dbo.amazon_orders 
values ('171-8186847-5348334',300,'Rahul Bansal','Huggies','2023-02-11 12:12:12',413.72,'Bangalore','UPI','2023-02-10 12:12:30');
-----------------------------------------------------------------------------------------------------------------------------------
--drop table dbo.amazon_orders_1
create table dbo.amazon_orders_1
(
id int primary key,
order_id varchar(25) not null UNIQUE, --this is a not null constraint and unique constraint
customer_id integer ,
customer_name varchar(200),
product_name varchar(200),
order_date date,
cost decimal(6,3),
address varchar(1000),
payment_mode varchar(50),
delivery_date datetime
);

insert into dbo.amazon_orders_1 
values (1,'171-8186847-5348336',400,'Sushil Bansal','Huggies','2023-02-11 12:12:12',413.72,'Bangalore','UPI','2023-02-10 12:12:30');

insert into dbo.amazon_orders_1 
values (2,'171-8186847-5348334',400,'Sushil Bansal','Huggies','2023-02-11 12:12:12',413.72,'Bangalore','UPI','2023-02-10 12:12:30');

insert into dbo.amazon_orders_1
values (3,'171-8186847-5348889',300,'Rahul Bansal','Huggies','2023-02-11 12:12:12',413.72,'Bangalore','UPI','2023-02-10 12:12:30');

-----------------------------------------------------------------------------------------------------------------------------------
--drop table dbo.amazon_orders_2
create table dbo.amazon_orders_2
(
order_id varchar(25) primary key, --this is a primary key constarint
customer_id integer ,
customer_name varchar(200),
product_name varchar(200),
order_date date default getdate(), -- this is default constraint
cost decimal(6,3) check (cost >= 100 and cost <500), -- this CHECK constraint ensures that the cost must be > 100 and < 500
address varchar(1000),
payment_mode varchar(50) check (payment_mode in ('UPI','CREDIT CARD')), -- this CHECK constraint ensures that the costpayment mode should be either in UPI or CREDIT CARD
delivery_date datetime default getdate()
);

insert into dbo.amazon_orders_2 
values ('order13',2000,'Sushil Bansal','Huggies',getdate(),100,'Bangalore','UPI',default);


alter table dbo.amazon_orders_2  
add constraint cons_cust_id unique(customer_id) --SQL adds a constraint named "cons_cust_id" that is a UNIQUE constraint on column (CUSTOMER_ID). 

--insert values for specific columns
insert into dbo.amazon_orders_2 (customer_id,cost,payment_mode,order_id)
values (2100,200,'UPI','order15')

select GETDATE() --to get the current date and time

--delete a record from a table with/without a condition
delete from amazon_orders_2 
where order_id='order15' 

--update a column value in the table with/without where condition
update amazon_orders_2
set payment_mode='UPI', cost=200
where order_id='order13'
-----------------------------------------------------------------------------------------------------------------------------------

-- DDL -> Data Definition Language   = create, alter , drop , constaint 
-- DML -> Data Manipulation Language = insert, update, delete
-- DQL -> Data Query Language        = select
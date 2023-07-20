
-- write a query to find top 5 sub categories in west region by total quantity sold
select top 5 sub_category , sum(quantity) as total_qty
from orders
where region='West'
group by sub_category
order by total_qty desc

--3 write a query to get total profit, first order date and latest order date for each category
select  category , sum(profit) as total_profit,min(order_date) as first_order_date,max(order_date) as latest_order_date
from orders
group by category;

---count
select * from orders
select count(*) from orders --9994
select count(order_id) from orders --9994
select count(distinct sub_category) from orders
select count(country) from orders --9994
select count(*) from orders where country is not null
select count(1) from orders --9994

-------------
select 7- top 1 5- category , sum(sales) as total_sales,avg(profit) as avg_profit
1- from orders
2- where ship_mode='First class'
3- group by category
4- having sum(sales)<800000 and avg(profit) > 10 
6- order by total_sales desc;

--having
select category,sub_category, sum(sales) as total_sales, avg(profit) as total_profit
from orders
group by category,sub_category
having sum(sales)> 300000
order by total_sales desc
-------
select category, sum(sales) as total_sales,max(order_date)
from orders
group by category
having max(order_date)> '2021-01-01'
-------
select category, sum(sales) as total_sales,max(order_date)
from orders
group by category
having min(order_date) < '2021-01-01'
-------
select order_id,count(*)
from orders
group by order_id
having count(order_id)>1
-------
select country,count(*),count(country)
from orders
group by country
having count(*)>1
-------
select order_id as order_number,order_date,profit,sales,profit+sales+100 as profit_ratio, 1 as order_id 
from orders
where sales > 5*profit
order by order_id
-------
select category, sum(sales),sum(profit),sum(sales)/sum(profit)
from orders
group by category
having sum(sales)/sum(profit) <10
-------
select category, sum(sales),sum(profit),sum(sales)/sum(profit)
from orders
where category='Furniture'
group by category
having min(sub_category)='table'
-------

--case when 
select order_id,order_date,profit,
case 
	when profit > 20 then 'High profit'
	when profit >10 then 'Medium profit'
	when profit > 0 then 'Low profit'
else 'loss'
end as profit_loss_flag
from orders

select order_id,order_date,profit,profit/sales as ratio
,case 
	when profit between 10 and 20 then 'Medium profit'
	when profit > 20 then 'High profit'
	when profit between 0 and 9 then 'Low profit'
else 'loss'
end as profit_loss_flag
from orders
where  
case 
	when profit between 10 and 20 then 'Medium profit'
	when profit > 20 then 'High profit'
	when profit between 0 and 9 then 'Low profit'
else 'loss'
end='loss'


/* This query output gives the sum of sales from Medium Profit,loss,High Profit and Low profit*/
select
case 
	when profit between 10 and 20 then 'Medium profit'
	when profit > 20 then 'High profit'
	when profit between 0 and 9 then 'Low profit'
else 'loss'
end as profit_loss_flag, sum(sales) as total_sales
from orders
group by  
case 
	when profit between 10 and 20 then 'Medium profit'
	when profit > 20 then 'High profit'
	when profit between 0 and 9 then 'Low profit'
else 'loss'
end






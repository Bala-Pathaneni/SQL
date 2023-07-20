select * from orders
where order_date between '2020-01-01' and '2020-12-31'
--(order_date >='2020-01-01' and order_date <='2020-12-31')

select * from orders
where quantity not between 1 and 3;

select * from orders
where quantity between 1 and 3;

select * from orders
where quantity in ( 1, 3);

update orders
set country = null
where order_id in ('CA-2019-133585','CA-2021-145765')

select * from orders 
where country is null

select * from orders 
where country is not null

select * from orders 
where country = ''

select order_id,order_date,customer_name
from orders
where customer_name like '%Ritter'

select order_id,order_date,customer_name
from orders
where customer_name like 'T%n%Ritter'

/* 
percentage % - 0 or more any character
underscore _ -> any one character
square brackets [AV] [A-D] [^aB]
*/

select order_id,order_date,customer_name
from orders
where customer_name not like '%Ritter'

select distinct customer_name -- order_id,order_date,customer_name
from orders
where customer_name like '_a%'

select order_id,order_date,customer_name
from orders
where customer_name like '[MST]a%'---1st letter can be any 1 OF THE M,S,T

select order_id,order_date,customer_name
from orders
where customer_name like '[MST]a[tl]%' --1st letter can be any 1 OF THE M,S,T + 2nd letter should be A + 3rd letter can be any 1 OF THE T,L + Any number of characters

select order_id,order_date,customer_name
from orders
where customer_name like '[A-D]a[tl]%'


select order_id,order_date,customer_name
from orders
where customer_name like '[^MST]a[^tl]%'  --1st letter cannot be M,S,T + 2nd letter should be A + 3rd letter can be any 1 OF THE T,L + Any number of characters
and quantity > 3

-------data aggregation--

select sum(sales) 
from orders

select count(*) 
from orders

--count, sum,avg,min,max

select max(sales) 
from orders

select  category,ship_mode, sum(sales) as total_sales, avg(sales) as avg_sales
from orders
--where category='Furniture'
group by category,ship_mode
order by category,ship_mode
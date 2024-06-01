--Identify the highest-priced pizza.

select pizzas.price, pizza_type.name from pizzas
join pizza_type on pizzas.pizza_type = pizza_type. pizza_type
order by pizzas.price desc
limit 1
	--Identify the most common pizza size ordered

select quantity, count(order_id)
from order_details
group by quantity
order by count desc


--List the top 5 most ordered pizza types along with their quantities.
 select pizza_type.name, sum(order_details.quantity) as quantity from pizza_type 
join pizzas on pizza_type.pizza_type = pizzas.pizza_type
join order_details on order_details.pizza_id = pizzas.pizza_id
group by pizza_type.name 
order by quantity desc
limit 5


select pizza_type.name, sum(order_details.quantity) as quantity from order_details
join pizzas on order_details. pizza_id= pizzas.pizza_id
join pizza_type on pizza_type.pizza_type= pizzas.pizza_type
group by pizza_type.name

--Identify the most common pizza size ordered

select pizzas.size, count(order_details.order_id) as order_count from pizzas
join order_details on pizzas.pizza_id= order_details.pizza_id
group by pizzas.size
order by order_count desc;

--Join the necessary tables to find the total quantity of each pizza category ordered.

select pizza_type.category, sum(order_details.quantity) as total_quantity from pizza_type
join pizzas on pizza_type.pizza_type = pizzas. pizza_type
Join order_details on order_details.pizza_id= pizzas.pizza_id
group by pizza_type.category
order by total_quantity desc

--Determine the distribution of orders by hour of the day.
select * from orders
select hour (order_time)from orders

--Join relevant tables to find the category-wise distribution of pizzas.

select category, count(name) from pizza_type
group by category 

--Group the orders by date and calculate the average number of pizzas ordered per day.
	select round(avg(quantity),0)from 
(select orders.order_date, sum(order_details.quantity ) as quantity from orders
join order_details on orders.order_id = order_details.order_id
group by orders.order_date) as order_quantity


--Determine the top 3 most ordered pizza types based on revenue.
select pizza_type.name, sum(order_details.quantity * pizzas.price) as revenue from pizza_type
join pizzas on pizzas.pizza_id =pizza_type.pizza_type
join order_details on order_details.pizza_id=pizzas.pizza_id
group by pizza_type.name 
order by revenue 





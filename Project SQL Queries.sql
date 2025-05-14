create database pizzahut;
use pizzahut;
create table orders(
orders_id int not null,
order_date date not null,
order_time time not null,
primary key(orders_id));

create table orders_details(
orders_details_id int not null,
orders_id int not null,
pizza_id text not null,
quantity int not null,
primary key(orders_details_id));

-- Retrieve the total number of orders placed.
use pizzahut;
select count(orders_id) as total_orders from orders;



-- Calculate the total revenue generated from pizza sales.
select
round(sum(orders_details.quantity * pizzas.price),2) as total_sales
from orders_details join pizzas
on orders_details.pizza_id = pizzas.pizza_id;



-- Identify the highest-priced pizza.
select pizza_types.name, pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by price desc limit 1;


-- Identify the most common pizza size ordered.
select pizzas.size, count(orders_details.orders_details_id) as order_count
from pizzas join orders_details
on pizzas.pizza_id = orders_details.pizza_id
group by pizzas.size order by order_count  desc;

-- List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name,
sum(orders_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by quantity desc limit 5;



-- Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category, sum(orders_details.quantity) as quantity
from pizzas join pizza_types
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category;


-- Determine the distribution of orders by hour of the day
select hour(orders.order_time) as Hour, count(orders.orders_id) as order_count
from orders
group by hour order by order_count desc;



-- Join relevant tables to find the category-wise distribution of pizzas.
select  category, count(pizza_types.category) from pizza_types
group by pizza_types.category;


-- Group the orders by date and
-- calculate the average number of pizzas ordered per day.
select avg(quantity) from (select orders.order_date, sum(orders_details.quantity) as quantity
from orders join orders_details
on orders.orders_id = orders_details.orders_id
group by orders.order_date) as quantity_ordered;


-- Determine the top 3 most ordered pizza types based on revenue.
select pizza_types.name,
sum(orders_details.quantity* pizzas.price) as revenue
from pizza_types join pizzas
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by revenue desc limit 3;

-- Calculate the percentage contribution of each pizza type to total revenue.
select pizza_types.category, (sum(orders_details.quantity*pizzas.price)/
(select sum( orders_details.quantity*pizzas.price)
from orders_details join  pizzas
on orders_details.pizza_id = pizzas.pizza_id)*100) as revenue 
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category;


-- Analyze the cumulative revenue generated over time.
select order_date, sum(revenue) over ( order by order_date)
from
(select orders.order_date, sum(orders_details.quantity* pizzas.price) as revenue
from orders_details join pizzas
on orders_details.pizza_id = pizzas.pizza_id
join orders
on orders.orders_id = orders_details.orders_id
group by orders.order_date) as sales;


-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select category, name, revenue from
(select name, category, revenue, rank() over ( partition by category order by revenue) as rn
from
(select pizza_types.category, pizza_types.name, round(sum(orders_details.quantity*pizzas.price),1) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category, pizza_types.name) as a) as b
where rn <=3;




































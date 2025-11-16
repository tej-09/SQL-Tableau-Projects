SELECT o.order_id,
    o.date,
    pt.name AS pizza_name,
    pt.category,
    od.quantity,
    p.price
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
LIMIT 10;

-- Total Revenue
SELECT SUM(p.price * od.quantity) AS total_revenue 
FROM order_details od 
JOIN pizzas p ON od.pizza_id = p.pizza_id;

-- top 5 best selling pizzas
SELECT pt.name,
	   SUM(od.quantity) AS total_sold
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_sold DESC
LIMIT 5;

-- busiest hours 
SELECT HOUR(time) AS order_hour,
	   COUNT(order_id) AS total_orders
FROM orders 
GROUP BY order_hour
ORDER BY total_orders DESC;

-- most selling pizza categeory
SELECT pt.category,
	  SUM(od.quantity) AS total_sold
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_sold DESC;
	  

USE olist_project;
select * from olist_customers_dataset limit 5;

SELECT 
    c.customer_id,
    COUNT(o.order_id) AS total_orders
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC;


select * from olist_order_items_dataset ORDER BY RAND() limit 5 ;

SELECT order_id,SUM(price + freight_value) AS order_revenue
FROM olist_order_items_dataset
GROUP BY order_id;

SELECT 
    c.customer_id,
    SUM(oi.price + oi.freight_value) AS total_revenue
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY total_revenue DESC;





CREATE TABLE customer_analytics 
SELECT 
    c.customer_id,
    COUNT(o.order_id) AS total_orders,
    SUM(oi.price + oi.freight_value) AS total_revenue,
    AVG(oi.price + oi.freight_value) AS avg_order_value
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id;

DESCRIBE customer_analytics;

SELECT * FROM customer_analytics LIMIT 10;
DESCRIBE customer_analytics;





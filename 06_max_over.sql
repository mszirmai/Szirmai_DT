WITH cte1 AS(
    SELECT cu.customer_id, cu.customer_name, MAX(o.order_date) OVER(PARTITION BY customer_name) AS last_order_date, MAX(o.order_date) over() AS latest_order_date FROM customers cu
    INNER JOIN orders o ON cu.customer_id = o.customer_id
)
SELECT * FROM cte1
WHERE last_order_date >= latest_order_date - INTERVAL '90 days';
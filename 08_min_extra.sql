WITH cte1 AS(
    SELECT cu.customer_name, DATE_TRUNC('month', MIN(o.order_date))::date AS first_order FROM customers cu
    INNER JOIN orders o ON cu.customer_id = o.customer_id
    GROUP BY cu.customer_name
)
SELECT * FROM cte1 WHERE first_order = '2024-06-01'
AND EXISTS(SELECT order_date FROM orders o
INNER JOIN customers cu On o.customer_id = cu.customer_id
INNER JOIN cte1 ON cte1.customer_name = cu.customer_name
WHERE order_date>'2024-06-01' AND cu.customer_name = cte1.customer_name);
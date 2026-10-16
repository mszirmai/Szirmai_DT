-- Active: 1790170267664@@127.0.0.1@5432@superstore
WITH cte1 AS(
    SELECT cu.customer_name, o.order_id, o.order_date FROM customers cu
    INNER JOIN orders o ON cu.customer_id = o.customer_id
),
cte2 AS(
    SELECT *, ROW_NUMBER() OVER(PARTITION BY customer_name ORDER BY order_date DESC) AS row_num FROM cte1
)
SELECT * FROM cte2 WHERE row_num <= 2;
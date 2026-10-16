WITH cte1 AS(
    SELECT cu.customer_name, SUM(o.sales) AS total_sales FROM customers cu
    INNER JOIN orders o ON cu.customer_id = o.customer_id
    GROUP BY customer_name
)
SELECT *, NTILE(4) OVER(ORDER BY total_sales DESC) AS quartile FROM cte1;
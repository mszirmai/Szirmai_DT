WITH cte1 AS(
    SELECT customer_id, SUM(quantity*unit_price) AS total_amount FROM retail_sales WHERE customer_id IS NOT NULL GROUP BY customer_id
)
SELECT *, NTILE(4) OVER(ORDER BY total_amount DESC) FROM cte1;
WITH cte1 AS(
    SELECT country, DATE_TRUNC('month',invoice_date) AS month, customer_id, SUM(unit_price*quantity) AS total_amount,
    DENSE_RANK() OVER(PARTITION BY country, DATE_TRUNC('month',invoice_date) ORDER BY SUM(unit_price*quantity) DESC) AS sales_rank
    FROM retail_sales GROUP BY customer_id, month, country
)
SELECT * FROM cte1
WHERE month>='2011-01-01' AND sales_rank<=5
ORDER BY country, month, sales_rank, customer_id;
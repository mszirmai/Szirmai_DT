WITH cte1 AS(
    SELECT country, DATE_TRUNC('month', invoice_date)::date AS month, SUM(quantity*unit_price) AS total_amount FROM retail_sales GROUP BY country, month
)
SELECT *, NTILE(4) OVER(PARTITION BY country ORDER BY total_amount DESC) AS sales_quartile FROM cte1
ORDER BY country, month;
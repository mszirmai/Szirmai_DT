WITH cte1 AS(
    SELECT DATE_TRUNC('month', o.order_date)::date AS month, SUM(o.sales) AS monthly_sales FROM orders o
    GROUP BY month
),
cte2 AS(
    SELECT *, LAG(monthly_sales,1) OVER(ORDER BY month) AS prev_month_sales
    FROM cte1
)
SELECT *, monthly_sales - prev_month_sales AS sales_change,
ROUND((monthly_sales - prev_month_sales)/prev_month_sales*100,2) AS grow_percentage FROM cte2
ORDER BY month;
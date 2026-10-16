WITH cte1 AS(
    SELECT DATE_TRUNC('month',order_date)::date AS month, SUM(sales) AS monthly_sales FROM orders
    GROUP BY month
),
cte2 AS(
    SELECT *, LAG(monthly_sales,1) OVER(ORDER BY month) AS prev_month_sales,
    LEAD(monthly_sales,1) OVER(ORDER BY month) AS next_month_sales FROM cte1
)
SELECT * FROM cte2 ORDER BY month;
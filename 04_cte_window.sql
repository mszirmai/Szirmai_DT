WITH cte1 AS(
    SELECT customer_type, SUM(total_amount) AS revenue FROM flourmills_sales
    GROUP BY customer_type
), cte2 AS(
    SELECT *, SUM(revenue) OVER() AS total_revenue, ROUND(100*revenue/SUM(revenue) OVER(),2) AS revenue_percentage FROM cte1
)
SELECT * FROM cte2;
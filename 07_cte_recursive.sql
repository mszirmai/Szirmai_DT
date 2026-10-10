WITH RECURSIVE cte1 AS(
    SELECT DATE_TRUNC('month',sale_date) as month, SUM(total_amount) AS revenue FROM flourmills_sales
    GROUP BY month
), cte2 AS(
    SELECT ROW_NUMBER() OVER(ORDER BY month) AS rn, month, revenue FROM cte1
), cte3 AS(
    SELECT rn, month, revenue, revenue AS cumulative_revenue FROM cte2 where rn=1
    UNION ALL
    SELECT c2.rn, c2.month, c2.revenue, (c3.cumulative_revenue + c2.revenue) AS cumulative_revenue FROM cte2 c2
    INNER JOIN cte3 c3 ON c2.rn=c3.rn+1
    WHERE cumulative_revenue<500000000
)
SELECT * FROM cte3;
WITH cte1 AS(
    SELECT cu.region, cu.customer_name, SUM(o.profit) AS total_profit FROM customers cu
    INNER JOIN orders o ON cu.customer_id = o.customer_id
    GROUP BY customer_name, region
),
cte2 AS(
    SELECT *,
    RANK() OVER(PARTITION BY region ORDER BY total_profit DESC) AS profit_rank,
    DENSE_RANK() OVER(PARTITION BY region ORDER BY total_profit DESC) AS profit_dense_rank FROM cte1
)
SELECT * FROM cte2;
WITH cte1 AS(
    SELECT product_category, product_name, SUM(total_amount) AS total_product_sales FROM flourmills_sales
    GROUP BY product_category, product_name
),
cte2 AS(
    SELECT *, RANK() OVER(
        PARTITION BY product_category
        ORDER BY total_product_sales DESC
    ) AS category_rank FROM cte1
    
)
SELECT * FROM cte2 WHERE category_rank<=3;
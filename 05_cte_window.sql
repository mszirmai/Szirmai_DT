WITH cte1 AS(
    SELECT ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY sale_date DESC) AS row_num ,customer_id, product_name, sale_date, total_amount FROM flourmills_sales
)
SELECT * FROM cte1 WHERE row_num=1;
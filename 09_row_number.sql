WITH cte1 AS(
    SELECT invoice_no, stock_code, description, quantity, unit_price, quantity*unit_price AS amount,
    ROW_NUMBER() OVER(PARTITION BY invoice_no ORDER BY quantity*unit_price DESC) AS row_num FROM retail_sales
)
SELECT * FROM cte1 WHERE row_num<=3;
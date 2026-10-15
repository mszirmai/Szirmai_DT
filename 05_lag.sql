WITH cte1 AS(
    SELECT stock_code, invoice_no, invoice_date, 
LAG(unit_price,1) OVER(PARTITION BY stock_code ORDER BY invoice_date) as previous_price,
unit_price AS current_price,
unit_price - LAG(unit_price,1) OVER(PARTITION BY stock_code ORDER BY invoice_date) AS price_difference FROM retail_sales
)
SELECT * FROM cte1 WHERE previous_price IS NOT NULL AND price_difference != 0
ORDER BY invoice_date;
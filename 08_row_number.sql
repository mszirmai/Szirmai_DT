WITH cte1 AS(
    SELECT customer_id, invoice_no, invoice_date, stock_code, description, quantity, unit_price,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY invoice_date) AS rn FROM retail_sales
)
SELECT customer_id, invoice_no, invoice_date, stock_code, description, quantity, unit_price, rn FROM cte1 WHERE rn=1
ORDER BY customer_id;
WITH cte1 AS(
    SELECT customer_id, invoice_no, invoice_date::date, 
LEAD(invoice_date, 1) OVER(PARTITION BY customer_id ORDER BY invoice_date)::date AS next_invoice_date,
(LEAD(invoice_date, 1) OVER(PARTITION BY customer_id ORDER BY invoice_date)::date - invoice_date::date) AS days_to_next_invoice FROM(
    SELECT DISTINCT customer_id, invoice_no, invoice_date FROM retail_sales
))
SELECT * FROM cte1 WHERE next_invoice_date IS NOT NULL
ORDER BY days_to_next_invoice DESC; 
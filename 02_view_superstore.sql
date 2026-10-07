CREATE OR REPLACE VIEW regional_monthly_sales AS
SELECT cu.region, DATE_TRUNC('month',order_date) AS month, SUM(o.sales) AS monthly_sales FROM customers cu
INNER JOIN orders o ON cu.customer_id = o.customer_id
GROUP BY cu.region, DATE_TRUNC('month',order_date)
ORDER BY DATE_TRUNC('month',order_date);

SELECT * FROM regional_monthly_sales WHERE region = 'West';
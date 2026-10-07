CREATE OR REPLACE VIEW high_value_customers AS
SELECT cu.customer_id, cu.customer_name, SUM(o.sales) AS total_sales FROM customers cu
INNER JOIN orders o ON cu.customer_id = o.customer_id
GROUP BY cu.customer_id
HAVING SUM(o.sales)>2000;

select * FROM high_value_customers;
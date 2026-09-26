SELECT cu.customer_name, SUM(o.sales) FROM customers cu
INNER JOIN orders o ON cu.customer_id = o.customer_id
GROUP BY cu.customer_name
HAVING SUM(o.sales)>2000;
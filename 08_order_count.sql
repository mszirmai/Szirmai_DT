SELECT cu.customer_name, COUNT(o.order_id) AS order_count FROM customers cu
LEFT JOIN orders o ON cu.customer_id = o.customer_id
GROUP BY cu.customer_name;
SELECT cu.customer_name, o.order_id, o.sales FROM customers cu
FULL OUTER JOIN orders o ON cu.customer_id = o.customer_id;
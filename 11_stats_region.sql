SELECT cu.region, SUM(o.sales) as total, ROUND(AVG(o.discount),4) AS avg_discount, COUNT(o.order_id) AS order_count FROM customers cu
INNER JOIN orders o ON cu.customer_id = o.customer_id
GROUP BY cu.region;
SELECT cu.region, SUM(o.sales) FROM customers cu
INNER JOIN orders o ON cu.customer_id = o.customer_id
GROUP BY cu.region;
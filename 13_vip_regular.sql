SELECT cu.customer_name, SUM(o.sales) AS total, ROUND(AVG(o.discount),4) AS avg_sale, COUNT(o.order_id) AS order_count,
CASE 
    WHEN (SELECT SUM(o2.sales) FROM orders o2 INNER JOIN customers cu2 ON cu2.customer_id = o2.customer_id where cu.customer_name = cu2.customer_name)>2500 THEN 'VIP'
    ELSE 'REGULAR'
END AS customer_type FROM customers cu
INNER JOIN orders o ON cu.customer_id = o.customer_id
GROUP BY cu.customer_name
ORDER BY SUM(o.sales) DESC;
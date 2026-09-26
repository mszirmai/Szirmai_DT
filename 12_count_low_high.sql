SELECT cu.region,
(SELECT COUNT(o.sales) FROM orders o INNER JOIN customers cu2 ON o.customer_id = cu2.customer_id WHERE o.sales>1000 AND cu2.region = cu.region) AS "high-value count", 
(SELECT COUNT(o.sales) FROM orders o INNER JOIN customers cu2 ON o.customer_id = cu2.customer_id WHERE o.sales<=1000 AND cu2.region = cu.region) AS "low-value count" FROM customers cu
INNER JOIN orders o ON cu.customer_id = o.customer_id
GROUP BY cu.region;

/*Nemyslím si, že sme sa učili používať case when*/
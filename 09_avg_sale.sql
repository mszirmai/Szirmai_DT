SELECT pr.category, ROUND(AVG(o.discount),4) FROM products pr
INNER JOIN orders o ON pr.product_id = o.product_id
GROUP BY pr.category;
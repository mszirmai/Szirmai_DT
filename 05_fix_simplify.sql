SELECT 
    p.category,
    p.product_name,
    SUM(o.sales) AS product_sales,
    SUM(SUM(o.sales)) OVER (PARTITION BY p.category) AS category_total,
    ROUND(
        SUM(o.sales) * 100.0 /
        SUM(SUM(o.sales)) OVER (PARTITION BY p.category),
        2
    ) AS pct_of_category
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category, p.product_name;

/*simplify?*/

WITH cte1 AS(
    SELECT p.category, p.product_name, SUM(o.sales) AS product_sales FROM products p
    INNER JOIN orders o ON p.product_id = o.product_id
    GROUP BY p.product_name, p.category
),
cte2 AS(
    SELECT *, SUM(product_sales) OVER(PARTITION BY category) AS category_total FROM cte1
)
SELECT *, ROUND(product_sales/category_total*100,2) AS pct_of_category FROM cte2;
WITH category_sales AS(
    SELECT product_category, SUM(total_amount) AS category_total FROM flourmills_sales
    GROUP BY product_category
)
SELECT product_category, category_total FROM category_sales
ORDER BY category_total DESC;
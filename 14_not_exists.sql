SELECT product_category FROM flourmills_sales fs1
WHERE NOT EXISTS(
    SELECT 1 FROM flourmills_sales fs2
    WHERE fs2.product_category = fs1.product_category
    AND total_amount > 500000
) GROUP BY product_category;
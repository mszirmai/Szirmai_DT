SELECT product_category FROM flourmills_sales fs1
WHERE EXISTS(SELECT 1 FROM flourmills_sales fs2 WHERE fs2.product_category = fs1.product_category HAVING COUNT(DISTINCT region)>3)
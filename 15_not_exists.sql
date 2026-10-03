SELECT region FROM flourmills_sales fs1
WHERE NOT EXISTS(
    SELECT 1 FROM flourmills_sales fs2
    WHERE fs2.region = fs1.region AND product_category = 'Flour'
);
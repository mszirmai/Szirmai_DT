SELECT * FROM flourmills_sales fs1
WHERE EXISTS(SELECT 1 FROM flourmills_sales fs2 WHERE fs2.region = fs1.region AND EXTRACT(YEAR FROM sale_date) = 2024);
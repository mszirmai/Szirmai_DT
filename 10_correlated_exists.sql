SELECT sales_id, product_name, total_amount FROM flourmills_sales fs1
WHERE EXISTS(SELECT product_name FROM flourmills_sales fs2 WHERE fs2.product_name = fs1.product_name
AND (SELECT COUNT(DISTINCT EXTRACT(MONTH FROM sale_date)) FROM flourmills_sales fs3 WHERE fs2.product_name=fs3.product_name GROUP BY(product_name))>1);
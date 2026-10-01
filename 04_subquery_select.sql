SELECT product_name, total_amount, (SELECT ROUND(AVG(total_amount),2) FROM flourmills_sales) AS avg_amount FROM flourmills_sales;

SELECT product_name, total_amount FROM flourmills_sales
WHERE total_amount = 9511208.41;
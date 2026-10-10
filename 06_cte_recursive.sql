WITH RECURSIVE cte1 AS(
    SELECT MIN(sale_date) AS min_date, MAX(sale_date) as max_date FROM flourmills_sales
    UNION ALL
    SELECT min_date+1, max_date FROM cte1
    WHERE min_date<max_date
)
SELECT * FROM cte1;
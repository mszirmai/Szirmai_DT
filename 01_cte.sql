-- Active: 1790170267664@@127.0.0.1@5432@datacraftinglab_db
WITH daily_sales AS (
    SELECT sale_date, SUM(total_amount) AS daily_total FROM flourmills_sales
    GROUP BY sale_date
)
SELECT sale_date, daily_total FROM daily_sales
WHERE daily_total>3000000
ORDER BY daily_total DESC;
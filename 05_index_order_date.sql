CREATE INDEX idx_orders_order_date ON orders(order_date);

SELECT DATE_TRUNC('month', order_date) as month, SUM(sales) as total_sales FROM orders
GROUP BY DATE_TRUNC('month',order_date)
ORDER BY month;
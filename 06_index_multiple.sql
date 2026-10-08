CREATE INDEX idx_orders_region_category ON orders(customer_id, order_date);

SELECT * FROM orders o
INNER JOIN customers cu ON o.customer_id = cu.customer_id
WHERE region='West' AND DATE(order_date)>='2024-01-01';
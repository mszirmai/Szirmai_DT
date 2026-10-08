CREATE INDEX idx_orders_customer_id ON orders(customer_id);

SELECT order_id FROM orders WHERE customer_id='C001';
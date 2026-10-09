-- Active: 1790170267664@@127.0.0.1@5432@retail_sales
CREATE DATABASE retail_sales;

CREATE TABLE orders(
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    product_id VARCHAR(20) NOT NULL,
    order_date DATE NOT NULL,
    region VARCHAR(20) NOT NULL,
    category VARCHAR(50) NOT NULL,
    ship_mode VARCHAR(30) NOT NULL,
    sales NUMERIC(9,2) NOT NULL,
    profit NUMERIC(9,2) NOT NULL
)

ALTER DATABASE retail_sales SET datestyle TO 'ISO, MDY';

SELECT * FROM orders;

SHOW datestyle; /*vracia MDY, ale datestyle stále vyzerá ako YMD*/
-- 1. Create Schema
CREATE DATABASE IF NOT EXISTS fmcg_analytics;
USE fmcg_analytics;

-- 2. Drop existing tables if re-running
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_products;
DROP TABLE IF EXISTS dim_channels;

-- 3. Product Dimension Table
CREATE TABLE dim_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_cost DECIMAL(10, 2)
);

-- 4. Channel Dimension Table
CREATE TABLE dim_channels (
    channel_id INT PRIMARY KEY,
    channel_name VARCHAR(50),
    tier VARCHAR(20)
);

-- 5. Sales Fact Table
CREATE TABLE fact_sales (
    transaction_id INT PRIMARY KEY,
    order_date DATE,
    product_id INT,
    channel_id INT,
    quantity_sold INT,
    unit_price DECIMAL(10, 2),
    discount_amount DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
    FOREIGN KEY (channel_id) REFERENCES dim_channels(channel_id)
);

-- 6. Insert Dimension Data
INSERT INTO dim_products VALUES 
(101, 'Hydrating Face Wash 150ml', 'Personal Care', 120.00),
(102, 'Protein Muesli Pack 500g', 'Packaged Foods', 180.00),
(103, 'Organic Green Tea 100g', 'Beverages', 90.00),
(104, 'Botanical Shampoo 300ml', 'Personal Care', 210.00);

INSERT INTO dim_channels VALUES 
(1, 'E-Commerce Marketplace', 'Direct'),
(2, 'Modern Trade Supermarkets', 'Retail'),
(3, 'Wholesale Distributors', 'B2B'),
(4, 'Quick Commerce Apps', 'Direct');

-- 7. Insert Fact Sales Data
INSERT INTO fact_sales VALUES 
(1001, '2026-01-15', 101, 1, 50, 250.00, 500.00),
(1002, '2026-01-18', 102, 2, 120, 350.00, 1500.00),
(1003, '2026-02-05', 103, 4, 200, 150.00, 800.00),
(1004, '2026-02-12', 104, 3, 300, 400.00, 6000.00),
(1005, '2026-03-01', 101, 2, 80, 250.00, 1000.00),
(1006, '2026-03-10', 102, 1, 150, 350.00, 2000.00),
(1007, '2026-03-22', 104, 4, 90, 400.00, 1800.00);
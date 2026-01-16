-- =====================================================
-- DATA LOADING USING POSTGRESQL COPY COMMAND
-- =====================================================
-- Notes:
-- 1. SERIAL columns are auto-generated and not loaded from CSV
-- 2. CSV files must include headers
-- 3. File paths are environment-dependent and should be updated accordingly
-- =====================================================


-- =========================
-- LOAD CUSTOMERS DATA
-- =========================
COPY customers (customer_name, email, city, state, signup_date)
FROM '/path/to/customers.csv'
DELIMITER ','
CSV HEADER;


-- =========================
-- LOAD PRODUCTS DATA
-- =========================
COPY products (product_name, category, price)
FROM '/path/to/products.csv'
DELIMITER ','
CSV HEADER;


-- =========================
-- LOAD ORDERS DATA
-- =========================
COPY orders (customer_id, order_date, order_status)
FROM '/path/to/orders.csv'
DELIMITER ','
CSV HEADER;


-- =========================
-- LOAD ORDER ITEMS DATA
-- =========================
COPY order_items (order_id, product_id, quantity, total_price)
FROM '/path/to/order_items.csv'
DELIMITER ','
CSV HEADER;


-- =========================
-- LOAD PAYMENTS DATA
-- =========================
COPY payments (order_id, payment_mode, payment_status, payment_date)
FROM '/path/to/payments.csv'
DELIMITER ','
CSV HEADER;
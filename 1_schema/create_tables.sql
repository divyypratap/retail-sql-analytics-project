-- DROP DATABASE RETAIL ANALYTICS
 DROP DATABASE IF EXISTS retail_analytics;

-- CREATE DATABASE RETAIL_ANALYTICS
CREATE DATABASE retail_analytics;

-- CREATING CUSTOMERS TABLE 
CREATE TABLE customers(
		customer_id SERIAL PRIMARY KEY,
		customer_name VARCHAR(100),
		email VARCHAR (100),
		city VARCHAR (50),
		state VARCHAR (50),
		signup_date DATE
);

-- CREATING PRODUCTS TABLE
CREATE TABLE products(
		product_id SERIAL PRIMARY KEY,
		product_name VARCHAR (100),
		category VARCHAR (50),
		price NUMERIC(10,2)
);

-- CREATING ORDERS TABLE
CREATE TABLE orders(
		order_id SERIAL PRIMARY KEY,
		customer_id INT REFERENCES customers(customer_id),
		order_date DATE,
		order_status VARCHAR(50)
);

-- CREATING ORDER_ITEMS TABLE
CREATE TABLE order_items(
		order_item_id SERIAL PRIMARY KEY,
		order_id INT REFERENCES orders(order_id),
		product_id INT REFERENCES products(product_id),
		quantity INT,
		total_price NUMERIC(10,2)
);

-- CREATING PAYMENTS TABLE 

CREATE TABLE payments(
		payment_id SERIAL PRIMARY KEY,
		order_id INT REFERENCES orders(order_id),
		payment_mode VARCHAR(50),
		payment_status VARCHAR(30),
		payment_date DATE
);




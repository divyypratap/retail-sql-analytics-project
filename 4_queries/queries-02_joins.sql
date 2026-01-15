/*
Purpose:
- Validate table relationships
- Create joined datasets for analysis
- Ensure referential integrity
*/

--JOIN 1: Orders + Customers
-- Orders with customer details	

SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    c.customer_id,
    c.customer_name,
    c.city,
    c.state
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;	
	
-- JOIN 2: Orders + Order Items 
-- Each order with its items

SELECT
    o.order_id,
    o.order_date,
    oi.product_id,
    oi.quantity,
    oi.total_price
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id;

-- JOIN 3: Full Order Flow (Customers → Orders → Items → Products)
-- Complete order-level view

SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    p.product_name,
    p.category,
    oi.quantity,
    oi.total_price
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id ASC;

-- JOIN 4: Payment Status Mapping (Orders + Payments) 
-- Orders with payment information

SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    p.payment_mode,
    p.payment_status,
    p.payment_date
FROM orders o
LEFT JOIN payments p
    ON o.order_id = p.order_id;
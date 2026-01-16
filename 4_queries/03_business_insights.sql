/*
Business Insights:
Retail analytics using customer, order, product, and payment data
*/

--INSIGHT 1 — Total Revenue

SELECT
    SUM(total_price) AS total_revenue
FROM order_items;

-- INSIGHT 2 — Total Orders vs Successful Orders

SELECT
    COUNT(*) AS total_orders,
    COUNT(*) FILTER (WHERE order_status = 'Completed') AS completed_orders
FROM orders;

--INSIGHT 3 —  Revenue by Category

SELECT
    p.category,
    SUM(oi.total_price) AS category_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- INSIGHT 4 — Top 10 Best-Selling Products

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 10;

-- INSIGHT 5 — Top 10 Revenue-Generating Customers

SELECT
    c.customer_name,
    SUM(oi.total_price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- INSIGHT 6 — Average Order Value (AOV)

SELECT
    ROUND(
        SUM(oi.total_price) / COUNT(DISTINCT o.order_id),
        2
    ) AS avg_order_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id;

--INSIGHT 7 — Orders by Payment Mode

SELECT
    payment_mode,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_mode
ORDER BY total_payments DESC;

--INSIGHT 8 — Failed vs Successful Payments

SELECT
    payment_status,
    COUNT(*) AS count
FROM payments
GROUP BY payment_status;

--INSIGHT 9 — Monthly Revenue Trend

SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.total_price) AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

--INSIGHT 10 — Customers With No Orders

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY customer_id;
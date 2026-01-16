
-- Rows counts

SELECT 'customers' AS table, COUNT(*) FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'payments', COUNT(*) FROM payments;

-- Check foreign key integrity

SELECT COUNT(*) AS orphan_orders
FROM orders 
LEFT JOIN customers ON orders.customer_id = customers.customer_id
WHERE customers.customer_id IS NULL;

-- Total orders
SELECT COUNT(*) FROM orders;

-- Orders that have items
SELECT COUNT(DISTINCT o.order_id)
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id;

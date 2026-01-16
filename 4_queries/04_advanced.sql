/*
Advanced SQL Analysis
Techniques Used:
- Common Table Expressions (CTEs)
- Window Functions (RANK, LAG, Running Totals)
- Business-driven aggregations and segmentation

Objective:
To derive actionable business insights from retail transaction data.
*/


-- Business Question 1:
-- Which customers contribute the highest total revenue over their lifetime?

-- Business Use Case:
-- Helps identify high-value customers for retention campaigns,
-- loyalty programs, and personalized marketing strategies.

SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.total_price) AS lifetime_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY lifetime_value DESC;


-- Business Question 2:
-- How do customers rank based on total spending?

-- Business Use Case:
-- Enables customer tiering (Top 10%, VIP customers)
-- and helps prioritize customer engagement efforts.

SELECT
    customer_name,
    lifetime_value,
    RANK() OVER (ORDER BY lifetime_value DESC) AS customer_rank
FROM (
    SELECT
        c.customer_name,
        SUM(oi.total_price) AS lifetime_value
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_name
) x;

-- Business Question 3:
-- How does revenue change month over month?

-- Business Use Case:
-- Identifies growth trends, seasonality,
-- and periods of revenue decline for strategic planning.

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', o.order_date) AS month,
        SUM(oi.total_price) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY month
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    revenue - LAG(revenue) OVER (ORDER BY month) AS growth
FROM monthly_sales;


-- Business Question 4:
-- How does cumulative revenue grow over time?

-- Business Use Case:
-- Useful for executive dashboards to track
-- business performance and long-term revenue growth.

SELECT
    o.order_date,
    SUM(oi.total_price) AS daily_revenue,
    SUM(SUM(oi.total_price)) OVER (
        ORDER BY o.order_date
    ) AS cumulative_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- Business Question 5:
-- Which product generates the highest revenue in each category?

-- Business Use Case:
-- Supports product portfolio optimization,
-- inventory planning, and category-level decision making.

SELECT
    category,
    product_name,
    total_revenue
FROM (
    SELECT
        p.category,
        p.product_name,
        SUM(oi.total_price) AS total_revenue,
        RANK() OVER (
            PARTITION BY p.category
            ORDER BY SUM(oi.total_price) DESC
        ) AS rank_in_category
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.category, p.product_name
) x
WHERE rank_in_category = 1;

-- Business Question 6:
-- How can customers be segmented based on spending behavior?

-- Business Use Case:
-- Enables targeted marketing strategies,
-- budget allocation, and customer lifecycle management.

SELECT
    customer_name,
    lifetime_value,
    CASE
        WHEN lifetime_value >= 50000 THEN 'High Value'
        WHEN lifetime_value >= 20000 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM (
    SELECT
        c.customer_name,
        SUM(oi.total_price) AS lifetime_value
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_name
) x;


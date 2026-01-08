SELECT COUNT(*) AS total_customers
FROM customers;

SELECT SUM(total_amount) AS total_revenue
FROM orders;

SELECT 
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_orders DESC;

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

SELECT 
    ROUND(AVG(total_amount), 2) AS avg_order_value
FROM orders;

SELECT 
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;

SELECT 
    p.product_name,
    SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

WITH customer_revenue AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(o.total_amount) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT *
FROM (
    SELECT *,
           RANK() OVER (ORDER BY total_spent DESC) AS revenue_rank
    FROM customer_revenue
) ranked
WHERE revenue_rank <= 3;

SELECT 
    p.product_name,
    ROUND(
        SUM(oi.quantity * oi.price) * 100 /
        (SELECT SUM(quantity * price) FROM order_items),
    2) AS revenue_percentage
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue_percentage DESC;

SELECT 
    payment_mode,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN payment_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions
FROM payments
GROUP BY payment_mode;

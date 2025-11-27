WITH cte AS (
SELECT
	COUNT(order_status) AS complete_orders
    FROM orders
	WHERE order_status = 'completed'
)
SELECT
	complete_orders/(COUNT(order_status) + complete_orders) AS completed_vs_returned
    FROM orders
    JOIN cte
    WHERE order_status = 'returned'

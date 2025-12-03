-- This code calculates the amount of orders that are completed and not returned

WITH cte AS (
SELECT
	COUNT(CASE WHEN order_status = 'completed' THEN 1 END) AS completed_orders,
	COUNT(CASE WHEN order_status = 'returned' THEN 1 END) AS returned_orders
	FROM orders
)
SELECT
	completed_orders/CAST( (completed_orders + returned_orders) AS FLOAT) AS completed_ratio
	FROM cte;

-- Completed ratio: 0.4972177568937801

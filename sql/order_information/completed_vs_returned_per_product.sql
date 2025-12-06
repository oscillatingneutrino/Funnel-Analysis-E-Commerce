-- This code calcualtes how many orders are completed vs. returned for each product that has ever been purchased

WITH cte AS (
SELECT
	oi.product_id,
	COUNT(CASE WHEN o.order_status = 'completed' THEN 1 END) AS completed_orders,
	COUNT(CASE WHEN o.order_status = 'returned' THEN 1 END) AS returned_orders
	FROM orders o
		JOIN order_items oi
			ON o.order_id = oi.order_id
	GROUP BY oi.product_id
)
SELECT
	p.product_name,
	ROUND(completed_orders/CAST( (completed_orders + returned_orders) AS FLOAT), 2) AS completed_ratio
	FROM cte
		JOIN products p
			ON cte.product_id = p.product_id;

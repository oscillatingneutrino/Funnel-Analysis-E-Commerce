WITH cte AS (
SELECT order_id,product_id
FROM order_items
EXCEPT ALL
SELECT order_id,product_id
FROM reviews
),
cte2 AS (
SELECT
	cte.order_id,
	MIN(CASE WHEN o.order_status = 'processing' THEN o.date_number END) AS initial_time,
    MIN(CASE WHEN o.order_status = 'completed' THEN o.date_number END) AS completed_time
FROM cte
	JOIN orders o
		ON o.order_id = cte.order_id
GROUP BY cte.order_id
)
SELECT
	AVG(completed_time - initial_time) time_from_processing_to_completed
	FROM cte2
WHERE completed_time > initial_time

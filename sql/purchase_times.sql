SELECT
	oi.user_id,
	COUNT(DISTINCT oi.order_id) AS purchase_times
    FROM order_items oi
    JOIN orders o
		ON oi.order_id = o.order_id
WHERE order_status IN ('completed','processing','shipped')
GROUP BY oi.user_id
HAVING COUNT(DISTINCT oi.order_id) > 1
ORDER BY COUNT(oi.order_id) DESC

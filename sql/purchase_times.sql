-- This code calculates how many times a user has used the services to purchase an item
WITH cte AS(
SELECT
	oi.user_id,
	COUNT(DISTINCT oi.order_id) AS purchase_times
    FROM order_items oi
    JOIN orders o
		ON oi.order_id = o.order_id
WHERE order_status IN ('completed','processing','shipped')
GROUP BY oi.user_id
)
SELECT
	cte.user_id,
    u.name,
    purchase_times,
    DENSE_RANK() OVER (ORDER BY purchase_times DESC) as ranking
    FROM cte
    JOIN users u
		 ON cte.user_id = u.user_id
ORDER BY purchase_times DESC, u.name ASC

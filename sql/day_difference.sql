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
    oi.product_id,
	AVG(r.review_date_number - o.date_number) AS day_difference
FROM cte
	JOIN reviews r
		ON r.order_id = cte.order_id
	JOIN orders o
		ON o.order_id = cte.order_id
	JOIN order_items oi
		ON oi.order_id = cte.order_id
WHERE r.review_date_number - o.date_number > 0
	AND order_status IN('completed','returned')
GROUP BY cte.order_id, oi.product_id

)
SELECT *
	FROM cte2
ORDER BY product_id ASC

-- This code counts the total amount of times a product has been bought and lists its price and rating

WITH cte AS (
SELECT
	oi.product_id,
    COUNT(oi.product_id) AS product_count
    FROM order_items oi
	GROUP BY oi.product_id
)
SELECT
    p.product_name,
	p.category,
    cte.product_id,
    cte.product_count,
    p.rating,
	p.price
    FROM cte
	JOIN products p
		ON cte.product_id = p.product_id
ORDER BY cte.product_count DESC

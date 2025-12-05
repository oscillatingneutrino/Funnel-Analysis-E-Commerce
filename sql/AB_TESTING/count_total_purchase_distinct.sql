-- This product counts items bought from Harbor or GreenLeaf from distinct users

WITH cte AS(
SELECT
	brand,
    o.user_id,
    COUNT(event_id) AS counter
    FROM products p
    JOIN events e
		ON p.product_id = e.product_id
	JOIN orders o
		on e.user_id = o.user_id
	WHERE event_type = 'purchase'
    AND category = 'clothing'
    AND (brand = 'Harbor' OR brand = 'GreenLeaf')
    AND order_status NOT IN ('returned','cancelled')
    GROUP BY brand, user_id
)
SELECT
	brand,
    COUNT(counter) AS count_total_purchase_distinct
    FROM cte
    WHERE counter = 1
    GROUP BY brand
    ORDER BY COUNT(counter) DESC

-- Answer for this dataset: 16 GreenLeaf,13 Harbor

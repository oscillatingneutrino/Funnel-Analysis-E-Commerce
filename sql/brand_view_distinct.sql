-- This code removes duplicates from the view count
WITH cte AS(
SELECT
	brand,
    user_id,
    COUNT(event_id) AS counter
    FROM products p
    JOIN events e
		ON p.product_id = e.product_id
	WHERE event_type = 'view'
    AND category = 'clothing'
    AND (brand = 'Harbor' OR brand = 'GreenLeaf')
    GROUP BY brand, user_id
)
SELECT
	brand,
    COUNT(counter) AS brand_view
    FROM cte
    WHERE counter = 1
    GROUP BY brand
    ORDER BY COUNT(counter) DESC

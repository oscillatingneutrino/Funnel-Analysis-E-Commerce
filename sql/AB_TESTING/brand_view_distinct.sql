-- This code removes duplicates from the view count
SELECT
	brand,
    COUNT(DISTINCT user_id) AS unique_views
    FROM products p
    JOIN events e
		ON p.product_id = e.product_id
	WHERE event_type = 'view'
    AND category = 'clothing'
    AND (brand = 'Harbor' OR brand = 'GreenLeaf')
    GROUP BY brand
	ORDER BY unique_views DESC

-- answer for this dataset: 623 Harbor, 505 GreenLeaf 

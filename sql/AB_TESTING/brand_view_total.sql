-- This code gives the total amount of views per brand

SELECT
	brand,
    COUNT(event_id) AS counter
    FROM products p
    JOIN events e
		ON p.product_id = e.product_id
	WHERE event_type = 'view'
    AND category = 'clothing'
    AND (brand = 'Harbor' OR brand = 'GreenLeaf')
    GROUP BY brand
    ORDER BY COUNT(event_id) DESC

-- Answer for this dataset: 646 Harbor, 522 GreenLeaf

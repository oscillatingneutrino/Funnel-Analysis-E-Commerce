-- This product counts items bought from Harbor or GreenLeaf

SELECT
	brand,
    COUNT(event_id) AS count_total_purchase
    FROM products p
    JOIN events e
		ON p.product_id = e.product_id
	JOIN orders o
		on e.user_id = o.user_id
	WHERE event_type = 'purchase'
    AND category = 'clothing'
    AND (brand = 'Harbor' OR brand = 'GreenLeaf')
    AND order_status NOT IN ('returned','cancelled')
    GROUP BY brand
    ORDER BY COUNT(event_id) DESC

-- Answer: 52 GreenLeaf, Harbor 38

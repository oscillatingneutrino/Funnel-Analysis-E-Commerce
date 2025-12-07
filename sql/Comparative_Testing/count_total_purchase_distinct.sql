-- This product counts items bought from Harbor or GreenLeaf from distinct users

SELECT
	brand,
    COUNT(DISTINCT oi.user_id) AS count_total_purchase
    FROM order_items oi
    JOIN products p
		ON p.product_id = oi.product_id
	JOIN orders o
		on oi.order_id = o.order_id
    WHERE category = 'clothing'
    AND (brand = 'Harbor' OR brand = 'GreenLeaf')
    AND order_status NOT IN ('returned','cancelled')
    GROUP BY brand
    ORDER BY count_total_purchase DESC

-- Answer for this dataset: 346 Harbor, 337 GreenLeaf

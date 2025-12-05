-- This product counts items bought from Harbor or GreenLeaf

SELECT
	brand,
    COUNT(*) AS count_total_purchase
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

-- Answer: arbor 357, GreenLeaf 345

WITH cte AS ( 
SELECT 
	product_id, 
	COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) AS purchase_count,
	COUNT(CASE WHEN event_type = 'wishlist' THEN 1 END) AS wishlist_count
	FROM events 
	WHERE event_type IN('purchase','wishlist') 
    GROUP BY product_id 
)
SELECT
	p.product_name,
	p.product_id,
	p.category,
	p.price,
	CASE WHEN cte.purchase_count * 0.75 > cte.wishlist_count
		THEN 'purchase'
		WHEN cte.purchase_count < cte.wishlist_count * 0.75
		THEN 'wishlist'
		ELSE 'Marginal Difference'
		END AS purchase_or_wishlist
	FROM products p
		JOIN cte 
			ON p.product_id = cte.product_id
ORDER BY p.price DESC

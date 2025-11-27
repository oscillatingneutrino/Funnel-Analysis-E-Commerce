WITH cte AS ( 
SELECT 
	product_id, 
	CASE WHEN 
		SUM( CASE WHEN event_type = 'purchase' THEN 1 ELSE -1 END) >= 0 
			THEN 'purchase' ELSE 'wishlist' END AS purchase_or_wishlist 
	FROM events WHERE event_type IN('purchase','wishlist') 
    GROUP BY product_id 
)
SELECT 
p.product_name,
p.category,
p.price,
cte.purchase_or_wishlist
FROM products p 
	JOIN cte 
		ON p.product_id = cte.product_id
ORDER BY p.price DESC

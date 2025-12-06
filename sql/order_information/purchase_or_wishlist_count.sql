-- This code counts the amount of products that have been wishlisted, purchased, or if there is not enough
-- data to determine if a product is more wishlisted than bought or vise versa

WITH cte AS ( 
SELECT 
	product_id, 
	COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) AS purchase_count,
	COUNT(CASE WHEN event_type = 'wishlist' THEN 1 END) AS wishlist_count
	FROM events 
	WHERE event_type IN('purchase','wishlist') 
    GROUP BY product_id 
),
 cte2 AS (
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
)
SELECT
	COUNT(CASE WHEN purchase_or_wishlist = 'purchase' THEN 1 END) purchase_,
    COUNT(CASE WHEN purchase_or_wishlist = 'wishlist' THEN 1 END) wishlist_,
    COUNT(CASE WHEN purchase_or_wishlist = 'Marginal Difference' THEN 1 END) M_
    FROM cte2

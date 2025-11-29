WITH cte AS(
	SELECT
		user_id,
        product_id,
        event_type,
        MIN(event_timestamp_number) AS first_event_time
        FROM events
        WHERE event_type IN('view','cart','purchase')
        GROUP BY user_id, product_id, event_type
),
cte2 AS (
	SELECT
    user_id,
    product_id,
    MIN(CASE WHEN event_type = 'view' THEN first_event_time END) AS view_timer,
    MIN(CASE WHEN event_type = 'cart' THEN first_event_time END) AS cart_timer,
    MIN(CASE WHEN event_type = 'purchase' THEN first_event_time END) AS purchase_timer
    FROM cte
    GROUP BY user_id,product_id
),
cte3 AS (
	SELECT
		user_id,
        product_id,
        
		CASE WHEN
			view_timer IS NOT NULL
		AND purchase_timer IS NOT NULL
        AND cart_timer IS NULL
        AND view_timer<purchase_timer
        THEN 'view_to_purchase'
        
		WHEN
			view_timer IS NOT NULL
		AND purchase_timer IS NOT NULL
        AND cart_timer IS NOT NULL
        AND view_timer < cart_timer
        AND cart_timer < purchase_timer
        THEN 'view_to_cart_to_purchase'
        
		WHEN
			view_timer IS NULL
		AND purchase_timer IS NOT NULL
        AND cart_timer IS NOT NULL
        AND cart_timer < purchase_timer
        THEN 'cart_to_purchase'
        
        ELSE 'other_path'
        
        END AS path
        FROM cte2
        GROUP BY user_id,product_id
)
SELECT 
	path,
    COUNT(*)
	FROM cte3
    GROUP BY path

-- for this dataset: view to purchase: 3; other path: 58424



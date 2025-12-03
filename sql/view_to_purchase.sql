-- This code calculates the amount it takes for a product to be viewed and then bought

WITH cte AS(
	SELECT
		user_id,
        product_id,
		MIN(event_timestamp_number) AS purchase_time
		FROM events
        WHERE event_type = 'purchase'
        GROUP BY user_id,product_id
),
cte2 AS ( 
	SELECT
	user_id,
    product_id,
    MIN(event_timestamp_number) AS view_time
    FROM events
    WHERE event_type = 'view'
	GROUP BY user_id,product_id
)
SELECT
    AVG(cte.purchase_time - cte2.view_time) AS view_to_purchase
    FROM cte
		JOIN cte2
			ON cte.user_id = cte2.user_id
            AND cte.product_id = cte2.product_id

-- In this dataset, the answer was: -140.76855571428626

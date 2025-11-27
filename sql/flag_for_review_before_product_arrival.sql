



/* To check the amount of flagged users
WITH cte AS ( 
SELECT
	o.user_id,
		SUM( CASE WHEN o.date_number > r.review_date_number THEN 1 ELSE 0 END) AS number_review_before_arrival
	FROM orders o
	JOIN reviews r
		ON o.user_id = r.user_id
WHERE o.order_status NOT IN('completed','returned')
GROUP BY o.user_id
),
cte2 AS (SELECT
	user_id,
	CASE WHEN number_review_before_arrival > 0 
		THEN 'Flag' ELSE 'Normal' END AS review_before_arrival
	FROM cte
)
SELECT
	COUNT(user_id)
    FROM cte2
WHERE review_before_arrival = 'Flag'
*/
-- Answer for this dataset: 4135

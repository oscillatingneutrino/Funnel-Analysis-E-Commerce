SELECT
	u.user_id,
	CASE WHEN u.signup_date_number > MIN(e.event_timestamp_number) 
		THEN 'Flag' ELSE 'Normal' END AS order_date_flag
	FROM users u
		JOIN events e
			ON u.user_id = e.user_id
		GROUP BY u.user_id, u.signup_date_number

/* To check the amount of users who are flagged:
WITH cte AS (
SELECT
	u.user_id,
	CASE WHEN u.signup_date_number > MIN(e.event_timestamp_number) 
		THEN 'Flag' ELSE 'Normal' END AS order_date_flag
	FROM users u
		JOIN events e
			ON u.user_id = e.user_id
		GROUP BY u.user_id, u.signup_date_number
)
SELECT
	COUNT(*)
    FROM cte
	WHERE order_date_flag = 'Flag'
*/

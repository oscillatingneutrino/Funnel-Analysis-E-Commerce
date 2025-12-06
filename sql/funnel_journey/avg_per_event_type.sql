-- This code calculates the amount of time from account creation to the first time an individual performs
-- a particular action

WITH cte AS(
	SELECT
	user_id,
    MIN(event_timestamp_number) AS min_timestamp
    FROM events
    GROUP BY user_id
),
cte2 AS (
SELECT
	u.user_id,
	(u.signup_date_number - cte.min_timestamp) AS time_difference
    FROM users u
		JOIN cte
			ON u.user_id = cte.user_id
)
SELECT
	e.event_type,
	ROUND(AVG(cte2.time_difference),2) AS avg_per_event_type
    FROM cte2
		JOIN events e
			ON cte2.user_id = e.user_id
	GROUP BY e.event_type
    ORDER BY AVG(cte2.time_difference) DESC

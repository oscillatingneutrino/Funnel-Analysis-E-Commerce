-- answers the question of, how long did it take from action to signup or vise versa

WITH cte AS (
	SELECT
		user_id,
        MIN(signup_date_number) AS earliest_event
        FROM users
        GROUP BY user_id
)
SELECT
	ROUND(AVG(CASE WHEN o.date_number > cte.earliest_event THEN o.date_number - cte.earliest_event END),2) AS signup_before,
    ROUND(ABS(AVG(CASE WHEN o.date_number < cte.earliest_event THEN o.date_number - cte.earliest_event END)),2) AS signup_after
        FROM cte
	JOIN orders o
		ON cte.user_id = o.user_id

-- Answers for this dataset: signup before: 229.87, signup after: 225.95

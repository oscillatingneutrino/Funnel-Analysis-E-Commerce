WITH cte AS (
SELECT
	user_id,
	COUNT(*) AS counter
    FROM events
GROUP BY user_id
)
SELECT
	AVG(counter)
		FROM cte

-- Answer:8.0094

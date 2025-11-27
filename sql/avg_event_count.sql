SELECT 
	AVG(counter)
		FROM
			(SELECT
				user_id,
				COUNT(event_type) AS counter
				FROM events
				GROUP BY user_id) AS table1;

-- For this dataset: 8.0094

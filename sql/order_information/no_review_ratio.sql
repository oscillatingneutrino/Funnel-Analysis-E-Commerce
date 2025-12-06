-- This code calculates the ratio of products that have been bought but not reviewed

WITH cte AS (
SELECT order_id,product_id
FROM order_items
EXCEPT ALL
SELECT order_id,product_id
FROM reviews
),
cte2 AS (
SELECT
COUNT(*) AS counter
FROM cte
),
cte3 AS (
	SELECT
	COUNT(*) AS other_counter
    FROM reviews
)
SELECT
	counter/ CAST( (cte3.other_counter + counter) AS FLOAT ) no_review_ratio
    FROM cte2
		JOIN cte3

-- For this dataset: 0.6553546400753625

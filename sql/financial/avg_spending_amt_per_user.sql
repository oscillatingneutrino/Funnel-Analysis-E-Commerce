-- This code calculates the average amount spent by a user per order

WITH cte AS (
SELECT
	order_id,
	SUM(item_total) AS sum_spent
    FROM order_items
GROUP BY order_id
)
SELECT
	ROUND(AVG(sum_spent),2)
    FROM cte

-- Result: 595.93

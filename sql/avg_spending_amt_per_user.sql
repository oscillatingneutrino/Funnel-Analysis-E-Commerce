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

-- Answer: 595.93

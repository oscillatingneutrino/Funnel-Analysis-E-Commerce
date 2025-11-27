WITH cte AS (
SELECT
	order_id,
	SUM(item_total) AS sum_spent
    FROM order_items
GROUP BY order_id
)
SELECT
	AVG(sum_spent)
    FROM cte

-- Answer: 595.9334475000019

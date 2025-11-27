WITH cte AS (
SELECT
	p.category,
	oi.order_id,
	SUM(oi.item_total) AS sum_spent_per_category
    FROM order_items oi
    JOIN products p
		ON oi.product_id = p.product_id
GROUP BY oi.order_id,p.category
)
SELECT
	category,
	AVG(sum_spent_per_category) AS avg_spent_per_category
    FROM cte
GROUP BY category

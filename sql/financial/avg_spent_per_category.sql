-- This code calculates the average amount spent per order per brand per category

WITH cte AS (
SELECT
	p.brand,
	p.category,
	oi.order_id,
	SUM(oi.item_total) AS sum_spent_per_category
    FROM order_items oi
    JOIN products p
		ON oi.product_id = p.product_id
	JOIN orders o
		ON oi.order_id = o.order_id
	WHERE order_status NOT IN ('returned','cancelled')
	GROUP BY oi.order_id,p.brand,p.category
)
SELECT
	brand,
	cte.category,
	ROUND(AVG(sum_spent_per_category),2) AS avg_spent_per_category
    FROM cte
	GROUP BY brand,category

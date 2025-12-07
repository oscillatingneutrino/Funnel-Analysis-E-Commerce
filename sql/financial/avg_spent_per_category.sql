-- This code calculates the average amount spent per order per brand per category per item
-- averages are done in tableau, but this method allows for product comparison
-- if need be

WITH cte AS (
SELECT
	p.brand,
	p.category,
    p.product_name,
	oi.order_id,
	SUM(oi.item_total) AS sum_spent_per_category
    FROM order_items oi
    JOIN products p
		ON oi.product_id = p.product_id
	JOIN orders o
		ON oi.order_id = o.order_id
	WHERE order_status NOT IN ('returned','cancelled')
	GROUP BY oi.order_id,p.brand,p.category,p.product_name
)
SELECT
	brand,
	cte.category,
    product_name,
	ROUND(AVG(sum_spent_per_category),2) AS avg_spent_per_category
    FROM cte
	GROUP BY brand,category,product_name
    ORDER BY brand ASC

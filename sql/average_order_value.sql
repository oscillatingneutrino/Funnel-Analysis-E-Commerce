SELECT
	ROUND(AVG(total_spent),2) AS average_order_value
    FROM(
SELECT
	order_id,
	SUM(item_total) AS total_spent
    FROM order_items
    GROUP BY order_id) AS t1;

-- For this dataset: 595.93

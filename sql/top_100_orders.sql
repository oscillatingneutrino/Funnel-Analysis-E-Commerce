-- This code calculates the 100 greatest orders

WITH cte AS (
	SELECT
    order_id,
    ROUND(SUM(item_total),2) AS total_per_order
    FROM order_items
    GROUP BY order_id
)
SELECT
	user_id,
	order_id,
    total_per_order,
    top_100_orders
    FROM (SELECT
			o.user_id,
			cte.order_id,
			total_per_order,
			RANK() OVER (ORDER BY total_per_order DESC) AS top_100_orders
			FROM cte
			JOIN orders o
				ON o.order_id = cte.order_id
			WHERE order_status NOT IN('cancelled','returned')) AS t1
   WHERE top_100_orders BETWEEN 1 AND 100
   ORDER BY top_100_orders ASC


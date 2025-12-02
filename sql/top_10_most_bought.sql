WITH cte AS (
	SELECT
		product_id,
        item_price,
        SUM(quantity) AS quant_sum
        FROM order_items
        GROUP BY product_id,item_price
)
SELECT
	t1.product_id,
    product_name,
    category,
	item_price,
    ranking
    FROM
    (
		SELECT
		cte.product_id,
        item_price,
		RANK() OVER (ORDER BY quant_sum DESC) AS ranking
		FROM cte
	) AS t1
    JOIN products p
		 ON p.product_id = t1.product_id
    WHERE ranking<=10

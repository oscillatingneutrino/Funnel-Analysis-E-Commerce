WITH cte AS(
SELECT
	p.brand,
    p.category,
	COUNT(oi.product_id) AS counter
    FROM products p
	JOIN order_items oi
		ON p.product_id = oi.product_id
	JOIN orders o
		ON oi.order_id = o.order_id
	WHERE order_status NOT IN('cancelled','returned')
    GROUP BY p.brand, p.category
)
SELECT
	brand,
    category,
    counter,
    ranking
    FROM(
		SELECT
			brand,
			category,
			counter,
			RANK() OVER(partition by category ORDER BY counter DESC) AS ranking
			FROM cte
            ) AS t1
	WHERE ranking <=2
    AND category = 'Clothing'

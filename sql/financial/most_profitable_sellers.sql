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
),
cte2 AS(
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
			RANK() OVER(ORDER BY counter DESC) AS ranking
			FROM cte
            ) AS t1
)
SELECT
	brand,
    SUM(counter) AS summer
    FROM cte2
    GROUP BY brand
    ORDER BY SUM(counter) DESC
    

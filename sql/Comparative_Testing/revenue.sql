-- This code gets the total revenue for the two companies mentioned
-- for their clothing line

SELECT
	brand,
    ROUND(SUM(item_total),2) AS revenue
    FROM order_items oi
    JOIN products p
		ON p.product_id = oi.product_id
	JOIN orders o
		on oi.order_id = o.order_id
    WHERE category = 'clothing'
    AND (brand = 'Harbor' OR brand = 'GreenLeaf')
    AND order_status NOT IN ('returned','cancelled')
    GROUP BY brand
    ORDER BY revenue DESC

-- Answer: GreenLeaf: 57,842.83, Harbor: 45,550.82

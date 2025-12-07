-- This code retrieves the amount of clothing products sold by Harbor and GreenLeaf

SELECT
	brand,
    COUNT(product_name) AS products_amount
    FROM products
	WHERE category = 'Clothing'
	AND ( brand = 'Harbor' OR brand = 'GreenLeaf' )
    GROUP BY brand

-- Answer: GreenLeaf: 24, Harbor: 27

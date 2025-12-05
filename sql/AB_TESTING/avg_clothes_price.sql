-- this code gets the average product price for the top 2 ranked companies in clothing

SELECT
	brand,
    ROUND(AVG(price),2) avg_clothes_price
    FROM products
	WHERE category = 'Clothing'
	AND ( brand = 'Harbor' OR brand = 'GreenLeaf' )
    GROUP BY brand

-- GreenLeaf: 114.10, Harbor: 95.69

-- This code gets the average rating of the top 2 companies for their clothing category

SELECT
	brand,
    ROUND(AVG(rating),2) AS avg_rating
    FROM products
	WHERE category = 'Clothing'
	AND ( brand = 'Harbor' OR brand = 'GreenLeaf' )
    GROUP BY brand

-- Ans: GreenLeaf: 3.81, Harbor: 3.84

-- This code retrieves the users who have made no purchase(s)

SELECT user_id FROM users
EXCEPT
SELECT user_id FROM orders
ORDER BY user_id ASC;

/*
-- Answer question on how many users have no purchases
SELECT
	COUNT(*)
FROM (SELECT user_id FROM users
EXCEPT
SELECT user_id FROM orders
ORDER BY user_id ASC) AS t1;

-- In this dataset: 1365
*/

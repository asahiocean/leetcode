-- 1158. Market Analysis I
-- https://leetcode.com/problems/market-analysis-i/

SELECT user_id AS buyer_id, join_date, COALESCE(COUNT(o.order_id),0) AS orders_in_2019
FROM Users u LEFT JOIN Orders o ON u.user_id = o.buyer_id AND YEAR(order_date)='2019'
GROUP BY user_id ORDER BY user_id
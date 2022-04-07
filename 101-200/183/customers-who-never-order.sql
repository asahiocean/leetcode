-- 183. Customers Who Never Order
-- https://leetcode.com/problems/customers-who-never-order/

SELECT Name AS Customers FROM Customers
LEFT JOIN Orders ON Customers.Id = CustomerId
WHERE Orders.Id IS NULL
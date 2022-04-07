-- 584. Find Customer Referee
-- https://leetcode.com/problems/find-customer-referee/

SELECT name FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL
-- 182. Duplicate Emails
-- https://leetcode.com/problems/duplicate-emails/

# Write your MySQL query statement below
SELECT Email FROM Person
GROUP BY Email
HAVING COUNT(*) > 1
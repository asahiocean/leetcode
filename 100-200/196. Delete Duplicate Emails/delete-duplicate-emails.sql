-- 196. Delete Duplicate Emails
-- https://leetcode.com/problems/delete-duplicate-emails/

# Write your MySQL query statement below
DELETE FROM Person
WHERE Id != (
    SELECT Id FROM (SELECT * FROM Person) P
    WHERE Email = Person.Email
    ORDER BY Id
    LIMIT 1
)
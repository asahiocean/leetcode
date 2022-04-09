-- 1667. Fix Names in a Table
-- https://leetcode.com/problems/fix-names-in-a-table/

SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users ORDER BY user_id;
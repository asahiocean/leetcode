-- 1729. Find Followers Count
-- https://leetcode.com/problems/find-followers-count/

SELECT USER_ID, COUNT(*) AS followers_count
FROM Followers GROUP BY USER_ID ORDER BY USER_ID
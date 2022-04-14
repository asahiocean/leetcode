-- 1890. The Latest Login in 2020
-- https://leetcode.com/problems/the-latest-login-in-2020/

SELECT user_id, MAX(time_stamp) AS last_stamp
FROM Logins WHERE time_stamp LIKE '2020%' GROUP BY user_id
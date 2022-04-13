-- 1141. User Activity for the Past 30 Days I
-- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/

SELECT activity_date `day`, COUNT(DISTINCT user_id) `active_users`
FROM Activity WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date
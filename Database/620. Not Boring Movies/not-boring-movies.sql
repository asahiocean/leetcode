-- 620. Not Boring Movies
-- https://leetcode.com/problems/not-boring-movies/

# Write your MySQL query statement below
SELECT id, movie, description, rating # KEEP THE ORDER
FROM cinema
WHERE description <> "boring" AND (id % 2) <> 0
ORDER BY rating DESC;
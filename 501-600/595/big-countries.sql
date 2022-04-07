-- 595. Big Countries
-- https://leetcode.com/problems/big-countries/

-- USE >= INSTEAD OF > OTHERWISE THERE MAY BE AN ERROR
SELECT name, population, area FROM World
WHERE population >= 25000000 OR area >= 3000000
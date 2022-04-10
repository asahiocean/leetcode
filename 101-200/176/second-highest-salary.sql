-- 176. Second Highest Salary
-- https://leetcode.com/problems/second-highest-salary/

SELECT max(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (
    SELECT max(Salary)
    FROM Employee
)
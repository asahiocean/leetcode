-- 181. Employees Earning More Than Their Managers
-- https://leetcode.com/problems/employees-earning-more-than-their-managers/

# Write your MySQL query statement below
SELECT e.Name AS Employee
FROM Employee AS e
JOIN Employee AS m ON m.Id = e.ManagerId
WHERE e.Salary > m.Salary
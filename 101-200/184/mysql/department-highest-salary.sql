-- 184. Department Highest Salary
-- https://leetcode.com/problems/department-highest-salary/

SELECT D.NAME "Department", E.NAME "Employee", E.SALARY
FROM Employee E JOIN Department D on E.departmentId = D.Id
WHERE (E.departmentId, E.SALARY) IN
(
SELECT departmentId, MAX(SALARY)
FROM Employee
GROUP BY departmentId
)
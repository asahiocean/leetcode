-- 185. Department Top Three Salaries
-- https://leetcode.com/problems/department-top-three-salaries/

SELECT D.NAME Department, A.NAME Employee, A.SALARY
FROM (SELECT E.*, DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY E.salary DESC) R FROM Employee E) A
JOIN Department D on A.departmentId = D.Id
WHERE A.R <= 3
-- 1965. Employees With Missing Information
-- https://leetcode.com/problems/employees-with-missing-information/

WITH t AS (
	SELECT employee_id
	FROM employees
	UNION
	SELECT employee_id
	FROM salaries
)
SELECT a.employee_id
FROM t a
LEFT JOIN employees b
ON a.employee_id = b.employee_id
LEFT JOIN salaries c
ON a.employee_id = c.employee_id
WHERE b.name IS null OR c.salary IS null
ORDER BY employee_id;
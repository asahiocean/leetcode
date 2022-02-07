-- 177. Nth Highest Salary
-- https://leetcode.com/problems/nth-highest-salary/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  DECLARE VAL INT;
    SET VAL = N - 1;
    RETURN (
        # Write your MySQL query statement below.
        SELECT DISTINCT SALARY
        FROM EMPLOYEE
        ORDER BY SALARY DESC
        LIMIT VAL,1
    );
END

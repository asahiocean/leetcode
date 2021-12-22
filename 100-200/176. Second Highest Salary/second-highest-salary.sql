-- 176. Second Highest Salary
-- https://leetcode.com/problems/second-highest-salary/

# Write your MySQL query statement below
select max(Salary) as SecondHighestSalary
from Employee
where Salary < (
    select max(Salary)
    from Employee
)
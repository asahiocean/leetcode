-- 175. Combine Two Tables
-- https://leetcode.com/problems/combine-two-tables/

SELECT FirstName, LastName, City, State from Person
LEFT JOIN Address P ON Person.PersonId = P.PersonId
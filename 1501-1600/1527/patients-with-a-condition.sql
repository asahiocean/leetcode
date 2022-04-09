-- 1527. Patients With a Condition
-- https://leetcode.com/problems/patients-with-a-condition/

SELECT * FROM PATIENTS WHERE
CONDITIONS LIKE '% DIAB1%' OR CONDITIONS LIKE 'DIAB1%';
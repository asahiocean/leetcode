-- 1587. Bank Account Summary II
-- https://leetcode.com/problems/bank-account-summary-ii/

SELECT u.name, SUM(amount) AS BALANCE
FROM USERS u, TRANSACTIONS t WHERE u.account = t.account
GROUP BY t.account HAVING SUM(amount) > 10000
-- 178. Rank Scores
-- https://leetcode.com/problems/rank-scores/

SELECT Score,
    DENSE_RANK() OVER (
        ORDER BY score DESC
    ) as `Rank`
FROM Scores;

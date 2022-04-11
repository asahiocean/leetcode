-- 1148. Article Views I
-- https://leetcode.com/problems/article-views-i/

SELECT DISTINCT(author_id) id FROM Views
WHERE author_id = viewer_id ORDER BY 1
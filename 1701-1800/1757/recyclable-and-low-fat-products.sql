-- 1757. Recyclable and Low Fat Products
-- https://leetcode.com/problems/recyclable-and-low-fat-products/

SELECT product_id FROM Products where low_fats = 'Y' and recyclable = 'Y';
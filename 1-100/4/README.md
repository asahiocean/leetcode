<h1>
4. Median of Two Sorted Arrays
<img src="https://bit.ly/3vO4Kh2" align="right">
</h1>

<img src="https://git.io/JDE5D" height="24" align="left"><b><a href="https://bit.ly/3MvJWSq">Solution</a> • <a href="https://bit.ly/3vO4xug">GitHub Gist</a> • <a href="https://bit.ly/3kd4Mto">LeetCode Discuss</a></b>

<p align="center">• • •</p>

<h2>Description</h2>

<p>
Given two sorted arrays <code>nums1</code> and <code>nums2</code> of size <code>m</code> and <code>n</code> respectively, return <b>the median</b> of the two sorted arrays.

The overall run time complexity should be <code>O(log (m+n))</code>.
</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> nums1 = [1,3], nums2 = [2]
<b>Output:</b> 2.00000
<b>Explanation:</b> merged array = [1,2,3] and median is 2.
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> nums1 = [1,2], nums2 = [3,4]
<b>Output:</b> 2.50000
<b>Explanation:</b> merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
</pre>

<h4>Constraints</h4>

<ul>
<li><code>nums1.length == m</code></li>
<li><code>nums2.length == n</code></li>
<li><code>0 <= m <= 1000</code></li>
<li><code>0 <= n <= 1000</code></li>
<li><code>1 <= m + n <= 2000</code></li>
<li><code>-106 <= nums1[i], nums2[i] <= 106</code></li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/median-of-two-sorted-arrays/

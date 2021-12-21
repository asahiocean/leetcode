## 4. Median of Two Sorted Arrays <img src="https://tinyurl.com/uc26jkuj" align="right" alt="views badge">

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift

// SOLUTION_SWIFT

```

<p>
<a href="GITHUB_GIST_URL">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/median-of-two-sorted-arrays/discuss/1134918">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given two sorted arrays `nums1` and `nums2` of size `m` and `n` respectively, return **the median** of the two sorted arrays.

The overall run time complexity should be `O(log (m+n))`.

#### Example 1

```
Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.
```

#### Example 2

```
Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
```

#### Example 3

```
Input: nums1 = [0,0], nums2 = [0,0]
Output: 0.00000
```

#### Example 4

```
Input: nums1 = [], nums2 = [1]
Output: 1.00000
```

#### Example 5

```
Input: nums1 = [2], nums2 = []
Output: 2.00000
```

#### Constraints

```
nums1.length == m
nums2.length == n
0 <= m <= 1000
0 <= n <= 1000
1 <= m + n <= 2000
-106 <= nums1[i], nums2[i] <= 106
```

---

**Source:** https://leetcode.com/problems/median-of-two-sorted-arrays/

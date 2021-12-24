<h1>
4. Median of Two Sorted Arrays
<img src="https://tinyurl.com/uc26jkuj" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let n1count = nums1.count
        let n2count = nums2.count
        
        var array = Array(repeating: 0, count: n1count + n2count)
        
        var i = n1count - 1, t = n2count - 1, c = n1count + n2count - 1
        
        while c >= 0 {
            if t < 0 || i >= 0 && nums1[i] > nums2[t] {
                array[c] = nums1[i]
                i = i - 1
            } else {
                array[c] = nums2[t]
                t = t - 1
            }
            c = c - 1
        }
        let x = array.count / 2
        return array.count % 2 == 0 ? Double(array[x-1] + array[x]) / 2 : Double(array[x])
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/5a9be64420276fa743455659ce530510">
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

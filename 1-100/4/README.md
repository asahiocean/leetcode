<h1>
4. Median of Two Sorted Arrays
<img src="https://tinyurl.com/mpumfakt" align="right" alt="views badge">
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
        
        let lenN1 = nums1.count, lenN2 = nums2.count
        
        var arr = [Int](repeating: 0, count: lenN1 + lenN2)
        
        var valA = lenN1 - 1,
            valB = lenN2 - 1,
            valC = lenN1 + lenN2 - 1
        
        while valC >= 0 {
            if valB < 0 || valA >= 0 && nums1[valA] > nums2[valB] {
                arr[valC] = nums1[valA]
                valA = (valA - 1)
            } else {
                arr[valC] = nums2[valB]
                valB = (valB - 1)
            }
            valC = valC - 1
        }
        let lenArr = arr.count, mid = (lenArr / 2)
        return lenArr % 2 == 0 ? Double(arr[mid-1] + arr[mid]) / 2 : Double(arr[mid])
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

<h2>Description</h2>

<p>
Given two sorted arrays `nums1` and `nums2` of size `m` and `n` respectively, return **the median** of the two sorted arrays.

The overall run time complexity should be `O(log (m+n))`.
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

<h4>Example 3</h4>

<pre>
<b>Input:</b> nums1 = [0,0], nums2 = [0,0]
<b>Output:</b> 0.00000
</pre>

<h4>Example 4</h4>

<pre>
<b>Input:</b> nums1 = [], nums2 = [1]
<b>Output:</b> 1.00000
</pre>

<h4>Example 5</h4>

<pre>
<b>Input:</b> nums1 = [2], nums2 = []
<b>Output:</b> 2.00000
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
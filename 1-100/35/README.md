<h1>
35. Search Insert Position
<img src="https://tinyurl.com/2xr9aumc" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var count = 0, r = (nums.count - 1)
        
        while count <= r {
            let n = count + (r - count) / 2
            if nums[n] < target {
                count = n + 1
            } else if nums[n] > target {
                r = n - 1
            } else {
                return n
            }
        }
        return count
    }
}
```

<p>
<a href="GITHUB_GIST_URL">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/search-insert-position/discuss/1320589/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You must write an algorithm with `O(log n)` runtime complexity.

<h4>Example 1</h4>

<pre>
<b>Input:</b> nums = [1,3,5,6], target = 5
<b>Output:</b> 2
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> nums = [1,3,5,6], target = 2
<b>Output:</b> 1
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> nums = [1,3,5,6], target = 7
<b>Output:</b> 4
</pre>

<h4>Constraints</h4>

<ul>
<li>
    <code>1 <= nums.length <= 10<sup>4</sup></code>
</li>
<li>
    <code>-10<sup>4</sup> <= nums[i] <= 10<sup>4</sup></code>
</li>
<li>
    <code>nums</code> contains <b>distinct</b> values sorted in <b>ascending</b> order.
</li>
<li>
    <code>-10<sup>4</sup> <= target <= 10<sup>4</sup></code>
</li>
</ul>

---

<b>Source:</b> https://leetcode.com/problems/search-insert-position/

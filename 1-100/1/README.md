<h1>
1. Two Sum
<img src="https://tinyurl.com/2p898fxp" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int:Int] = [:]
        for (i, n) in nums.enumerated() {
            if let last = dict[target - n] {
                return [last, i]
            }
            dict[n] = i
        }
        return []
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/5417d4f858b842d76876aabbe2932031">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/two-sum/discuss/1629845">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

<p>
Given an array of integers `nums` and an integer `target`, return _indices of the two numbers such that they add up to `target`_.
You may assume that each input would have **_exactly_ one solution**, and you may not use the _same_ element twice.
</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> nums = [2,7,11,15], target = 9
<b>Output:</b> [0,1]
<b>Output:</b> Because nums[0] + nums[1] == 9, we return [0, 1].
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> nums = [3,2,4], target = 6
<b>Output:</b> [1,2]
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> nums = [3,3], target = 6
<b>Output:</b> [0,1]
</pre>

<h4>Constraints</h4>

<ul>
<li><code>2 <= nums.length <= 10<sup>4</sup></code></li>
<li><code>-10<sup>9</sup> <= nums[i] <= 10<sup>9</sup></code></li>
<li><code>-10<sup>9</sup> <= target <= 10<sup>9</sup></code></li>
<li><b>Only one valid answer exists.</b></li>
</ul>

<hr/>

**Source:** https://leetcode.com/problems/two-sum/

## 1. Two Sum <img src="https://tinyurl.com/yc5ce92u" align="right">

<p>
<b>URL:</b> https://leetcode.com/problems/two-sum/
</p>

<details>
<summary><b>Solution</b></summary>
<br/>

```swift
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for (i, num) in nums.enumerated() {
            if let last = dict[target - num] {
                return [last, i]
            }
            dict[num] = i
        }
        return []
    }
}
```
<h4>More: <a href="https://git.io/JEYEW">[GitHub Gist]</a> • <a href="https://pastebin.com/dmceS55U">[Pastebin]</a> • <a href="https://controlc.com/e61c2150">[ControlC]</a> • <a href="https://textbin.net/jbpbnhoa4f">[TextBin]</a></h4>

</details>

<link rel="shortcut icon" type="image/png" href="/favicon.png">

<h2>Description</h2>

<div><p>Given an array of integers <code>nums</code>&nbsp;and an integer <code>target</code>, return <em>indices of the two numbers such that they add up to <code>target</code></em>.</p>

<p>You may assume that each input would have <strong><em>exactly</em> one solution</strong>, and you may not use the <em>same</em> element twice.</p>

<p>You can return the answer in any order.</p>

<p><strong>Example 1:</strong></p>

<pre><strong>Input:</strong> nums = [2,7,11,15], target = 9
<strong>Output:</strong> [0,1]
<strong>Output:</strong> Because nums[0] + nums[1] == 9, we return [0, 1].
</pre>

<p><strong>Example 2:</strong></p>

<pre><strong>Input:</strong> nums = [3,2,4], target = 6
<strong>Output:</strong> [1,2]
</pre>

<p><strong>Example 3:</strong></p>

<pre><strong>Input:</strong> nums = [3,3], target = 6
<strong>Output:</strong> [0,1]
</pre>

<p><strong>Constraints:</strong></p>

<ul>
	<li><code>2 &lt;= nums.length &lt;= 10<sup>4</sup></code></li>
	<li><code>-10<sup>9</sup> &lt;= nums[i] &lt;= 10<sup>9</sup></code></li>
	<li><code>-10<sup>9</sup> &lt;= target &lt;= 10<sup>9</sup></code></li>
	<li><strong>Only one valid answer exists.</strong></li>
</ul>

<p>
<h3>Topics:</h3>
<div style="display: inline-block;">
<a href=""><img src="https://git.io/JMuv0" style="height: 32px;"></a>
<a href=""><img src="https://git.io/JMuva" style="height: 32px;"></a>
</div>
</p>

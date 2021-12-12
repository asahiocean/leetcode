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
<h4>More: <a href="https://git.io/JEYEW">GitHub Gist</a> • <a href="https://pastebin.com/dmceS55U">Pastebin</a> • <a href="https://controlc.com/e61c2150">ControlC</a> • <a href="https://textbin.net/jbpbnhoa4f">TextBin</a></h4>

</details>

## Description

Given an array of integers `nums` and an integer `target`, return _indices of the two numbers such that they add up to `target`_.

You may assume that each input would have **_exactly_ one solution**, and you may not use the _same_ element twice.

You can return the answer in any order.

**Example 1:**

```
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Output: Because nums[0] + nums[1] == 9, we return [0, 1].
```

**Example 2:**

```
Input: nums = [3,2,4], target = 6
Output: [1,2]
```

**Example 3:**

```
Input: nums = [3,3], target = 6
Output: [0,1]
```

**Constraints:**

*   `2 <= nums.length <= 10<sup>4</sup>`
*   `-10<sup>9</sup> <= nums[i] <= 10<sup>9</sup>`
*   `-10<sup>9</sup> <= target <= 10<sup>9</sup>`
*   **Only one valid answer exists.**

<!-- 

### Topics:

<div style="display: inline-block;"><a href="">![](https://git.io/JMuv0)</a> <a href="">![](https://git.io/JMuva)</a></div>

-->

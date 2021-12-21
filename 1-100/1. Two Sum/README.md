## 1. Two Sum <img src="https://tinyurl.com/yc5ce92u" align="right" alt="views badge">

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
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

## Description

Given an array of integers `nums` and an integer `target`, return _indices of the two numbers such that they add up to `target`_.
You may assume that each input would have **_exactly_ one solution**, and you may not use the _same_ element twice.

#### Example 1
```
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Output: Because nums[0] + nums[1] == 9, we return [0, 1].
```

#### Example 2
```
Input: nums = [3,2,4], target = 6
Output: [1,2]
```

#### Example 3
```
Input: nums = [3,3], target = 6
Output: [0,1]
```

#### Constraints

* `2 <= nums.length <= 10<sup>4</sup>`
* `-10<sup>9</sup> <= nums[i] <= 10<sup>9</sup>`
* `-10<sup>9</sup> <= target <= 10<sup>9</sup>`
* **Only one valid answer exists.**

---

**Source:** https://leetcode.com/problems/two-sum/

<h1>
18. 4Sum
<img src="https://tinyurl.com/2p9y3esw" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }
        
        var result = [[Int]]()
        let nums = nums.sorted(), count = nums.count
        
        for i in 0..<(count - 1) where i == 0 || nums[i] != nums[i-1] {
            for j in (i + 1)..<count where j == i + 1 || nums[j] != nums[j-1] {
                var f = j + 1, l = count - 1
                while f < l {
                    let a = nums[f], b = nums[l], c = nums[i], d = nums[j]
                    let sum = a + b + c + d
                    if sum == target { result.append([a,b,c,d]) }
                    if sum < target {
                        while nums[f] == a, f < count - 1 { f += 1 }
                    } else {
                        while nums[l] == b, l > j { l -= 1 }
                    }
                }
            }
        }
        return result
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/40a69bd76ad1e38384d1cb63a2c0ba4c">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/4sum/discuss/1328067/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given an array `nums` of `n` integers, return _an array of all the **unique** quadruplets_ `[nums[a], nums[b], nums[c], nums[d]]` such that:

* `0 <= a, b, c, d < n`
* `a`, `b`, `c`, and `d` are **distinct**.
* `nums[a] + nums[b] + nums[c] + nums[d] == target`

You may return the answer in **any order**.

#### Example 1

<pre>
Input: nums = [1,0,-1,0,-2,2], target = 0
Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
</pre>

#### Example 2

<pre>
Input: nums = [2,2,2,2,2], target = 8
Output: [[2,2,2,2]]
</pre>

#### Constraints

* `1 <= nums.length <= 200`
* `-10<sup>9</sup> <= nums[i] <= 10<sup>9</sup>`
* `-10<sup>9</sup> <= target <= 10<sup>9</sup>`

---

**Source:** https://leetcode.com/problems/4sum/
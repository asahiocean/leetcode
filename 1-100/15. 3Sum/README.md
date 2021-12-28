<h1>
15. 3Sum
<img src="https://tinyurl.com/yckrjxxc" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [[Int]]() }
        
        var result = [[Int]]()
        let nums = nums.sorted()
        
        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i-1] { continue }
            
            let num = 0 - nums[i]
            var n = i + 1, c = nums.count - 1
            
            while n < c {
                let nn = nums[n], nc = nums[c]
                let sum = nn + nc
                if sum == num {
                    result.append([nums[i], nn, nc])
                    n += 1; c -= 1;
                    while n < c && nums[n] == nums[n-1] { n += 1 }
                    while n < c && nums[c] == nums[c+1] { c -= 1 }
                } else {
                    sum > num ? c -= 1 : (n += 1)
                }
            }
        }
        return result
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/ad5b43fc2fefa424cbd627395fd3b157">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/3sum/discuss/1144266/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given an integer array nums, return all the triplets ```[nums[i], nums[j], nums[k]]``` such that ```i != j```, ```i != k```, and ```j != k```, and ```nums[i] + nums[j] + nums[k] == 0```.

Notice that the solution set must not contain duplicate triplets.

#### Example 1

<pre>
<b>Input:</b> nums = [-1,0,1,2,-1,-4]
<b>Output:</b> [[-1,-1,2],[-1,0,1]]
</pre>

#### Example 2

<pre>
<b>Input:</b> nums = []
<b>Output:</b> []
</pre>

#### Example 3

<pre>
<b>Input:</b> nums = [0]
<b>Output:</b> []
</pre> 

#### Constraints

* ```0 <= nums.length <= 3000```
* ```-105 <= nums[i] <= 105```

---

**Source:** https://leetcode.com/problems/3sum/
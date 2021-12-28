<h1>
16. 3Sum Closest
<img src="https://tinyurl.com/3wbxdtzv" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        
        let sorted = nums.sorted()
        let length = sorted.count
        
        
        var diff: Int = .max
        var result = 0
        
        for i in 0..<length - 2 {
            var n = i + 1, q = length - 1
            while n < q {
                let sum = sorted[i] + sorted[n] + sorted[q]
                
                sum > target ? (q -= 1) : (n += 1)
                
                let value =  abs(sum - target)
                
                if value < diff {
                    diff = value
                    result = sum
                }
            }
        }
        return result
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/9ab8db4edb63f74a77f177fbddee4cde">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/3sum-closest/discuss/1147500/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given an array ```nums``` of **n** integers and an integer ```target```, find three integers in ```nums``` such that the sum is closest to ```target```. Return the sum of the three integers. You may assume that each input would have exactly one solution.

#### Example 1:

<pre>
<b>Input:</b> nums = [-1,2,1,-4], target = 1
<b>Output:</b> 2
<b>Explanation:</b> The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
</pre>

#### Constraints:
* ```3 <= nums.length <= 10^3```
* ```-10^3 <= nums[i] <= 10^3```
* ```-10^4 <= target <= 10^4```

---

**Source:** https://leetcode.com/problems/3sum-closest/

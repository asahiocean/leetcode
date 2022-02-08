<h1>
16. 3Sum Closest
<img src="https://tinyurl.com/5crhjryh" align="right" alt="views badge">
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
        
        let sort = nums.sorted()
        let len = sort.count
        
        var diff = Int.max
        var result = 0
        
        for i in 0..<len - 2 {
            var valA = i + 1, valB = len - 1
            while valA < valB {
                let sum = sort[i] + sort[valA] + sort[valB]
                
                if sum > target { valB -= 1 } else { valA += 1 }
                
                let value = abs(sum - target)
                
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

<h2>Description</h2>

<p>
Given an array <code>nums</code> of <strong>n</strong> integers and an integer <code>target</code>, find three integers in <code>nums</code> such that the sum is closest to <code>target</code>. Return the sum of the three integers. You may assume that each input would have exactly one solution.
</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> nums = [-1,2,1,-4], target = 1
<b>Output:</b> 2
<b>Explanation:</b> The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
</pre>

<h4>Constraints</h4>

<ul>
<li><code>3 <= nums.length <= 10^3</code></li>
<li><code>-10^3 <= nums[i] <= 10^3</code></li>
<li><code>-10^4 <= target <= 10^4</code></li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/3sum-closest/
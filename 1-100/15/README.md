<h1>
15. 3Sum
<img src="https://tinyurl.com/58x9zt48" align="right" alt="views badge">
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
        
        var result: [[Int]] = []
        let nums = nums.sorted()
        let len = nums.count
        
        guard len >= 3 else { return result }
        
        for i in 0..<len {
            if i > 0 && nums[i] == nums[i-1] { continue }
            
            let num = 0 - nums[i]
            var a = i + 1, b = len - 1
            
            while a < b {
                let numA = nums[a], numB = nums[b]
                let sum = numA + numB
                if sum == num {
                    result.append([nums[i], numA, numB])
                    a += 1
                    b -= 1
                    while a < b && nums[a] == nums[a-1] { a += 1 }
                    while a < b && nums[b] == nums[b+1] { b -= 1 }
                } else {
                    sum > num ? b -= 1 : (a += 1)
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

<h2>Description</h2>

<p>
Given an integer array nums, return all the triplets <code>[nums[i], nums[j], nums[k]]</code> such that <code>i != j</code>, <code>i != k</code>, and <code>j != k</code>, and <code>nums[i] + nums[j] + nums[k] == 0</code>.

Notice that the solution set must not contain duplicate triplets.
</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> nums = [-1,0,1,2,-1,-4]
<b>Output:</b> [[-1,-1,2],[-1,0,1]]
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> nums = []
<b>Output:</b> []
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> nums = [0]
<b>Output:</b> []
</pre> 

<h4>Constraints</h4>

<ul>
<li><code>0 <= nums.length <= 3000</code></li>
<li><code>-105 <= nums[i] <= 105</code></li>
</ul>
<hr>

<b>Source:</b> https://leetcode.com/problems/3sum/
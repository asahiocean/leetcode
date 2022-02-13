<h1>
18. 4Sum
<img src="https://tinyurl.com/ydave9ev" align="right" alt="views badge">
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
        let len = nums.count
        guard len >= 4 else { return [] }
        
        var result = [[Int]]()
        let sort = nums.sorted()
        
        for a in 0..<(len - 1) where a == 0 || sort[a] != sort[a-1] {
            for b in (a + 1)..<len where b == a + 1 || sort[b] != sort[b-1] {
                var c = b + 1, d = len - 1
                while c < d {
                    let val = (a: sort[a], b: sort[b], c: sort[c], d: sort[d])
                    let sum = (val.a + val.b + val.c + val.d)
                    if sum == target { result.append([val.a,val.b,val.c,val.d]) }
                    if sum < target {
                        while sort[c] == val.c, c < d { c += 1 }
                    } else {
                        while sort[d] == val.d, d > b { d -= 1 }
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

<h2>Description</h2>

<p>
Given an array <code>nums</code> of <code>n</code> integers, return <em>an array of all the <b>unique</b> quadruplets</em> <code>[nums[a], nums[b], nums[c], nums[d]]</code> such that:

<ul>
<li><code>0 <= a, b, c, d < n</code></li>
<li><code>a</code>, <code>b</code>, <code>c</code>, and <code>d</code> are <b>distinct</b>.</li>
<li><code>nums[a] + nums[b] + nums[c] + nums[d] == target</code></li>
</ul>

You may return the answer in <b>any order</b>.
</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> nums = [1,0,-1,0,-2,2], target = 0
<b>Output:</b> [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> nums = [2,2,2,2,2], target = 8
<b>Output:</b> [[2,2,2,2]]
</pre>

<h4>Constraints</h4>

<ul>
<li><code>1 <= nums.length <= 200</code></li>
<li><code>-10<sup>9</sup> <= nums[i] <= 10<sup>9</sup></code></li>
<li><code>-10<sup>9</sup> <= target <= 10<sup>9</sup></code></li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/4sum/
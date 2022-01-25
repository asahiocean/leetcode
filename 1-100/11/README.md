<h1>
11. Container With Most Water
<img src="https://tinyurl.com/2p968ye5" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        let len = height.count
        guard len > 2 else { return min(height[0], height[1]) }
        
        var area = 0
        var lhs = 0, rhs = len - 1
        
        while lhs < rhs {
            let lots = min(height[lhs], height[rhs]) * (rhs - lhs)
            area = max(area, lots)
            height[lhs] < height[rhs] ? (lhs += 1) : (rhs -= 1)
        }
        return area
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/2cd5c4c6e12e6d2f75a016019f3fe52b">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/container-with-most-water/discuss/1144091">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

<p>
Given n non-negative integers <code>a1, a2, ..., an</code>, where each represents a point at coordinate <code>(i, a<sub>i</sub>)</code>. n vertical lines are drawn such that the two endpoints of the line <code>i</code> is at <code>(i, a<sub>i</sub>)</code> and <code>(i, 0)</code>. Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.

<b>Notice</b> that you may not slant the container.

</p>

<h4>Example 1</h4>

<p><img src="https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/17/question_11.jpg" height="256"></p>

<pre>
<b>Input:</b> height = [1,8,6,2,5,4,8,3,7]
<b>Output:</b> 49
<b>Explanation:</b> The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> height = [1,1]
<b>Output:</b> 1
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> height = [4,3,2,1,4]
<b>Output:</b> 16
</pre>

<h4>Example 4</h4>

<pre>
<b>Input:</b> height = [1,2,1]
<b>Output:</b> 2
</pre>

<h4>Constraints</h4>

<ul>
<li><code>n == height.length</code></li>
<li><code>2 <= n <= 105</code></li>
<li><code>0 <= height[i] <= 104</code></li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/container-with-most-water/
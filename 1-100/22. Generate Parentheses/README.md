<h1>
22. Generate Parentheses
<img src="https://tinyurl.com/2s3ptp2t" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else { return [""] }
        
        var map: [Int:[String]] = [:], result: [String] = []
        if let parentheses = map[n] { return parentheses }
        
        for i in 0..<n {
            for l in generateParenthesis(i) {
                for r in generateParenthesis(n - 1 - i) {
                    result.append("(" + l + ")" + r)
                }
            }
        }
        map[n] = result
        
        return result
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/83c7760035843157ab517be92ddbc004">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/generate-parentheses/discuss/1656798/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given `n` pairs of parentheses, write a function to _generate all combinations of well-formed parentheses_.

#### Example 1

<pre>
<b>Input:</b> n = 3
<b>Output:</b> ["((()))","(()())","(())()","()(())","()()()"]
</pre>

#### Example 2

<pre>
<b>Input:</b> n = 1
<b>Output:</b> ["()"]
</pre>

#### Constraints

*   `1 <= n <= 8`

---

**Source:** https://leetcode.com/problems/generate-parentheses/

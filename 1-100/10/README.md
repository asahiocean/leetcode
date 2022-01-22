<h1>
10. Regular Expression Matching
<img src="https://tinyurl.com/3nbk8ehy" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        
        let lenS = s.count, lenP = p.count
        let arrS = Array(s), arrP = Array(p)
        
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: lenP + 1), count: lenS + 1)
        dp[lenS][lenP] = true
        
        for i in stride(from: lenS, through: 0, by: -1) {
            for j in stride(from: lenP - 1, through: 0, by: -1) {
                
                let first = i < lenS && (arrS[i] == arrP[j] || arrP[j] == ".")
                
                if j + 1 < lenP && arrP[j + 1] == "*" {
                    dp[i][j] = dp[i][j + 2] || first && dp[i + 1][j]
                } else {
                    dp[i][j] = first && dp[i + 1][j + 1]
                }
            }
        }
        return dp[0][0]
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/57821b959b331b1aeeebb62c02bec228">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/regular-expression-matching/discuss/1644123">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

<p>
Given an input string (<code>s</code>) and a pattern (<code>p</code>), implement regular expression matching with support for <code>'.'</code> and <code>'*'</code> where: 

<ul>
<li><code>'.'</code> Matches any single character.​​​​</li>
<li><code>'*'</code> Matches zero or more of the preceding element.</li>
</ul>

The matching should cover the <b>entire</b> input string (not partial).

</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> s = "aa", p = "a"
<b>Output:</b> false
<b>Explanation:</b> "a" does not match the entire string "aa".
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> s = "aa", p = "a*"
<b>Output:</b> true
<b>Explanation:</b> '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> s = "ab", p = ".*"
<b>Output:</b> true
<b>Explanation:</b> ".*" means "zero or more (*) of any character (.)".
</pre>

<h4>Example 4</h4>

<pre>
<b>Input:</b> s = "aab", p = "c*a*b"
<b>Output:</b> true
<b>Explanation:</b> c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
</pre>

<h4>Example 5</h4>

<pre>
<b>Input:</b> s = "mississippi", p = "mis*is*p*."
<b>Output:</b> false
</pre>

<h4>Constraints</h4>

<code>0 <= s.length <= 20</code>
<code>0 <= p.length <= 30</code>
<code>s</code> contains only lowercase English letters.
<code>p</code> contains only lowercase English letters, <code>'.'</code>, and <code>'*'</code>.
It is guaranteed for each appearance of the character <code>'*'</code>, there will be a previous valid character to match.

<hr>

<b>Source:</b> https://leetcode.com/problems/regular-expression-matching/
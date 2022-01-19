<h1>
5. Longest Palindromic Substring
<img src="https://tinyurl.com/2p8byaun" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let lnS = s.count
        guard lnS > 1 else { return s }
        
        let chars = [Character](s)
        
        var idx = lnS - 1, left = -1, right = -1, max = 1
        
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: lnS), count: lnS)
        
        while idx >= 0 {
            for j in idx..<lnS {
                dp[idx][j] = chars[idx] == chars[j] && (j - idx < 2 || dp[idx + 1][j - 1])
                if dp[idx][j], j - idx + 1 > max {
                    left = idx
                    right = j
                    max = j - idx + 1
                }
            }
            idx -= 1
        }
        return left == -1 ? String(chars[0]) : String(chars[left...right])
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/b856a0521c5db288e709fde55bd12e50">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/longest-palindromic-substring/discuss/1640332">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

<p>
Given a string <code>s</code>, return the longest palindromic substring in <code>s</code>.
</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> s = "babad"
<b>Output:</b> "bab"
<b>Note:</b> "aba" is also a valid answer.
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> s = "cbbd"
<b>Output:</b> "bb"
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> s = "a"
<b>Output:</b> "a"
</pre>

<h4>Example 4</h4>

<pre>
<b>Input:</b> s = "ac"
<b>Output:</b> "a"
</pre>

<h4>Constraints</h4>

<ul>
<li><code>1 <= s.length <= 1000</code></li>
<li><code>s</code> consist of only digits and English letters (lower-case and/or upper-case)</li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/longest-palindromic-substring/
<h1>
5. Longest Palindromic Substring
<img src="https://tinyurl.com/2p9e8wkw" align="right" alt="views badge">
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
        guard s.count > 1 else { return s }
        var left = -1, right = -1, max  = 1
        let chars = [Character](s)
        let strLenght = s.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: strLenght), count: strLenght)
        var index = strLenght - 1
        while index >= 0 {
            for j in index..<strLenght {
                dp[index][j] = chars[index] == chars[j] && (j - index < 2 || dp[index + 1][j - 1])
                if dp[index][j] {
                    if j - index + 1 > max {
                        left = index
                        right = j
                        max = j - index  + 1
                    }
                }
            }
            index -= 1
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

## Description

Given a string ```s```, return the longest palindromic substring in ```s```.

#### Example 1

<pre>
<b>Input:</b> s = "babad"
<b>Output:</b> "bab"
<b>Note:</b> "aba" is also a valid answer.
</pre>

#### Example 2

<pre>
<b>Input:</b> s = "cbbd"
<b>Output:</b> "bb"
</pre>

#### Example 3

<pre>
<b>Input:</b> s = "a"
<b>Output:</b> "a"
</pre>

#### Example 4

<pre>
<b>Input:</b> s = "ac"
<b>Output:</b> "a"
</pre>

#### Constraints

* ```1 <= s.length <= 1000```
* ```s``` consist of only digits and English letters (lower-case and/or upper-case)

---

**Source:** https://leetcode.com/problems/longest-palindromic-substring/

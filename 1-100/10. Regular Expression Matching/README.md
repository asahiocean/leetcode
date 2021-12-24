<h1>
10. Regular Expression Matching
<img src="https://tinyurl.com/y6va5aut" align="right" alt="views badge">
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
        
        var visit = [[Bool]]()
        let sLength = s.count, pCount = p.count
        
        for _ in 0...sLength + 1 {
            visit.append([Bool](repeating: false, count: pCount + 1))
        }
        
        visit[sLength][pCount] = true
        
        for i in stride(from: sLength, through: 0, by: -1) {
            for j in stride(from: pCount - 1, through: 0, by: -1) {
                
                let arrS = Array(s), arrP = Array(p)
                
                let first = i < sLength && (arrS[i] == arrP[j] || arrP[j] == ".")
                
                if j + 1 < pCount && arrP[j + 1] == "*" {
                    visit[i][j] = visit[i][j + 2] || first && visit[i + 1][j]
                } else {
                    visit[i][j] = first && visit[i + 1][j + 1]
                }
            }
        }
        return visit[0][0]
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

## Description

Given an input string (```s```) and a pattern (```p```), implement regular expression matching with support for ```'.'``` and ```'*'``` where: 

* ```'.'``` Matches any single character.​​​​
* ```'*'``` Matches zero or more of the preceding element.

The matching should cover the **entire** input string (not partial).

#### Example 1

<pre>
<b>Input:</b> s = "aa", p = "a"
<b>Output:</b> false
<b>Explanation:</b> "a" does not match the entire string "aa".
</pre>

#### Example 2

<pre>
<b>Input:</b> s = "aa", p = "a*"
<b>Output:</b> true
<b>Explanation:</b> '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
</pre>

#### Example 3

<pre>
<b>Input:</b> s = "ab", p = ".*"
<b>Output:</b> true
<b>Explanation:</b> ".*" means "zero or more (*) of any character (.)".
</pre>

#### Example 4

<pre>
<b>Input:</b> s = "aab", p = "c*a*b"
<b>Output:</b> true
<b>Explanation:</b> c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
</pre>

#### Example 5

<pre>
<b>Input:</b> s = "mississippi", p = "mis*is*p*."
<b>Output:</b> false
</pre>

#### Constraints

* ```0 <= s.length <= 20```
* ```0 <= p.length <= 30```
* ```s``` contains only lowercase English letters.
* ```p``` contains only lowercase English letters, ```'.'```, and ```'*'```.
* It is guaranteed for each appearance of the character ```'*'```, there will be a previous valid character to match.

---

**Source:** https://leetcode.com/problems/regular-expression-matching/
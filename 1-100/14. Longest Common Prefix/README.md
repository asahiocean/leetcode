<h1>
14. Longest Common Prefix
<img src="https://tinyurl.com/387trxx8" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        if strs.isEmpty { return "" }
        var common = strs[0]
        
        for ch in strs {
            while !ch.hasPrefix(common) {
                common = String(common.dropLast())
            }
        }
        return common
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/b537f2aa03c459e6f72df36e501170ce">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/longest-common-prefix/discuss/1136361">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string ```""```.

#### Example 1

<pre>
<b>Input:</b> strs = ["flower","flow","flight"]
<b>Output:</b> "fl"
</pre>

#### Example 2

<pre>
<b>Input:</b> strs = ["dog","racecar","car"]
<b>Output:</b> ""
Explanation: There is no common prefix among the input strings.
</pre>

#### Constraints

* ```0 <= strs.length <= 200```
* ```0 <= strs[i].length <= 200```
* strs[i] consists of only lower-case English letters.

---

**Source:** https://leetcode.com/problems/longest-common-prefix/
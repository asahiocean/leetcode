<h1>
28. Implement strStr()
<img src="https://tinyurl.com/yc77s5yh" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let nc = needle.count, hc = haystack.count
        
        if nc == 0 || haystack == needle { return 0 }
        
        guard hc >= nc else { return -1 }
        
        var hsi = haystack.startIndex
        for i in 0...(hc-nc) {
            let end = haystack.index(hsi, offsetBy: nc)
            if haystack[hsi..<end] == needle { return i }
            hsi = haystack.index(hsi, offsetBy: 1)
        }
        return -1
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/94dd5f3a0c3e51f1f3d83510edd1d856">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/implement-strstr/discuss/1656830/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Return the index of the first occurrence of needle in haystack, or `-1` if `needle` is not part of `haystack`.

**Clarification:**

What should we return when `needle` is an empty string? This is a great question to ask during an interview.

For the purpose of this problem, we will return 0 when `needle` is an empty string. This is consistent to C's [strstr()](http://www.cplusplus.com/reference/cstring/strstr/) and Java's [indexOf()](https://docs.oracle.com/javase/7/docs/api/java/lang/String.html#indexOf(java.lang.String)).

#### Example 1

<pre>
<b>Input:</b> haystack = "hello", needle = "ll"
<b>Output:</b> 2
</pre>

#### Example 2

<pre>
<b>Input:</b> haystack = "aaaaa", needle = "bba"
<b>Output:</b> -1
</pre>

#### Example 3

<pre>
<b>Input:</b> haystack = "", needle = ""
<b>Output:</b> 0
</pre>

#### Constraints

* <code>0 <= haystack.length, needle.length <= 5 * 10<sup>4</sup></code>
* `haystack` and `needle` consist of only lower-case English characters.

---

**Source:** https://leetcode.com/problems/implement-strstr/

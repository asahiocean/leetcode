<h1>
9. Palindrome Number
<img src="https://tinyurl.com/2mnmrwfe" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        return x < 0 ? false : method(x: x) == x
    }
    private func method(x: Int) -> Int {
        var r = 0
        var x = x
        while x != 0 {
            r = r * 10
            r = r + x % 10
            x /= 10
        }
        return (r < Int32.min || r > Int32.max) ? 0 : r
    }
}
```

<p>
<a href="GITHUB_GIST_URL">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/palindrome-number/discuss/1136330">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given an integer ```x```, return ```true``` if ```x``` is palindrome integer.

An integer is a **palindrome** when it reads the same backward as forward. For example, ```121``` is palindrome while ```123``` is not.

#### Example 1

<pre>
<b>Input:</b> x = 121
<b>Output:</b> true
</pre>

#### Example 2

<pre>
<b>Input:</b> x = -121
<b>Output:</b> false
<b>Explanation:</b> From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
</pre>

#### Example 3

<pre>
<b>Input:</b> x = 10
<b>Output:</b> false
<b>Explanation:</b> Reads 01 from right to left. Therefore it is not a palindrome.
</pre>

#### Example 4

<pre>
<b>Input:</b> x = -101
<b>Output:</b> false
</pre>

#### Constraints

* ```-231 <= x <= 231 - 1```

---

**Source:** https://leetcode.com/problems/palindrome-number/
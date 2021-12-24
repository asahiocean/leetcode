<h1>
7. Reverse Integer
<img src="https://tinyurl.com/a7rw3km6" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func reverse(_ x: Int) -> Int {
        var r = 0, x = x
        while x != 0 {
            r = r * 10
            r = r + (x % 10)
            x /= 10
        }
        return r < Int32.min || r > Int32.max ? 0 : r
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/28dd994d7a4a6d0f6c3371f341a663b1">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/reverse-integer/discuss/1598636">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given a signed 32-bit integer `x`, return `x` _with its digits reversed_. If reversing `x` causes the value to go outside the signed 32-bit integer range <code>[-2<sup>31</sup>, 2<sup>31</sup> - 1]</code>, then return `0`.

**Assume the environment does not allow you to store 64-bit integers (signed or unsigned).**

#### Example 1

<pre>
<b>Input:</b> x = 123
<b>Output:</b> 321
</pre>

#### Example 2

<pre>
<b>Input:</b> x = -123
<b>Output:</b> -321
</pre>

#### Example 3

<pre>
<b>Input:</b> x = 120
<b>Output:</b> 21
</pre>

#### Example 4

<pre>
<b>Input:</b> x = 0
<b>Output:</b> 0
</pre>

#### Constraints

* <code>-2<sup>31</sup> <= x <= 2<sup>31</sup> - 1</code>

---

**Source:** https://leetcode.com/problems/reverse-integer/

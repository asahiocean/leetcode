<h1>
7. Reverse Integer
<img src="https://tinyurl.com/bdhmfarr" align="right" alt="views badge">
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
        var res = 0, valX = x
        while valX != 0 {
            res = res * 10
            res = res + (valX % 10)
            valX /= 10
        }
        return res < Int32.min || res > Int32.max ? 0 : res
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

<h2>Description</h2>

<p>
Given a signed 32-bit integer <code>x</code>, return <code>x</code> _with its digits reversed_. If reversing <code>x</code> causes the value to go outside the signed 32-bit integer range <code>[-2<sup>31</sup>, 2<sup>31</sup> - 1]</code>, then return <code>0</code>.

<b>Assume the environment does not allow you to store 64-bit integers (signed or unsigned).</b>

</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> x = 123
<b>Output:</b> 321
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> x = -123
<b>Output:</b> -321
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> x = 120
<b>Output:</b> 21
</pre>

<h4>Example 4</h4>

<pre>
<b>Input:</b> x = 0
<b>Output:</b> 0
</pre>

<h4>Constraints</h4>

<ul>
<li><code>-2<sup>31</sup> <= x <= 2<sup>31</sup> - 1</code></li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/reverse-integer/

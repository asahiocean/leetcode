<h1>
9. Palindrome Number
<img src="https://tinyurl.com/mry7ja5b" align="right" alt="views badge">
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
        return x < 0 ? false : helper(x) == x
    }
    
    private func helper(_ x: Int) -> Int {
        var valR = 0
        var valX = x
        while valX != 0 {
            valR = (valR * 10)
            valR = (valR + valX % 10)
            valX /= 10
        }
        return (valR < Int32.min || valR > Int32.max) ? 0 : valR
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/d6e7c30bedaf8679623f9b1bff4a9e56">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/palindrome-number/discuss/1136330">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

<p>
Given an integer <code>x</code>, return <code>true</code> if <code>x</code> is palindrome integer.

An integer is a <b>palindrome</b> when it reads the same backward as forward. For example, <code>121</code> is palindrome while <code>123</code> is not.
</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> x = 121
<b>Output:</b> true
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> x = -121
<b>Output:</b> false
<b>Explanation:</b> From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> x = 10
<b>Output:</b> false
<b>Explanation:</b> Reads 01 from right to left. Therefore it is not a palindrome.
</pre>

<h4>Example 4</h4>

<pre>
<b>Input:</b> x = -101
<b>Output:</b> false
</pre>

<h4>Constraints</h4>

<ul>
<li><code>-231 <= x <= 231 - 1</code></li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/palindrome-number/
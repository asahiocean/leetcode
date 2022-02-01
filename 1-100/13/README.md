<h1>
13. Roman to Integer
<img src="https://tinyurl.com/2p8cbysa" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    
    private let dict: [Character:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
    
    func romanToInt(_ s: String) -> Int {
        var prev = 0, out = 0
        for i in s {
            let val = dict[i] ?? 0
            out += val <= prev ? prev : -prev
            prev = val
        }
        out += prev
        return out
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/e67c7625c87483f140213cbe0c5dcd50">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/roman-to-integer/discuss/1136349/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

<p>
Roman numerals are represented by seven different symbols: <code>I</code>, <code>V</code>, <code>X</code>, <code>L</code>, <code>C</code>, <code>D</code> and <code>M</code>.

<pre>
Symbol       Value
I            1
V            5
X            10
L            50
C            100
D            500
M            1000
</pre>

For example, <code>2</code> is written as <code>II</code> in Roman numeral, just two one&#39;s added together. <code>12</code> is written as <code>XII</code>, which is simply <code>X + II</code>. The number <code>27</code> is written as <code>XXVII</code>, which is <code>XX + V + II</code>.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not <code>IIII</code>. Instead, the number four is written as <code>IV</code>. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as <code>IX</code>. There are six instances where subtraction is used:

<ul>
<li><code>I</code> can be placed before <code>V</code> (5) and <code>X</code> (10) to make 4 and 9. </li>
<li><code>X</code> can be placed before <code>L</code> (50) and <code>C</code> (100) to make 40 and 90. </li>
<li><code>C</code> can be placed before <code>D</code> (500) and <code>M</code> (1000) to make 400 and 900.</li>
</ul>

Given a roman numeral, convert it to an integer.

</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> s = "III"
<b>Output:</b> 3
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> s = "LVIII"
<b>Output:</b> 58
<b>Explanation:</b> L = 50, V= 5, III = 3.
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> s = "MCMXCIV"
<b>Output:</b> 1994
<b>Explanation:</b> M = 1000, CM = 900, XC = 90 and IV = 4.
</pre>

<h4>Constraints</h4>

<ul>
<li><code>1 <= s.length <= 15</code></li>
<li><code>s</code> contains only the characters <code>('I', 'V', 'X', 'L', 'C', 'D', 'M')</code>.</li>
<li>It is guaranteed that s is a valid roman numeral in the range <code>[1, 3999]</code>.</li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/roman-to-integer/
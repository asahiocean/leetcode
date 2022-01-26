<h1>
12. Integer to Roman
<img src="https://tinyurl.com/4jx7wbmr" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    
    private let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    private let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    
    func intToRoman(_ num: Int) -> String {
        
        var int = num
        var sym = ""
        
        while int > 0 {
            for (i, d) in values.enumerated() where int - d >= 0 {
                int -= d
                sym += symbols[i]
                break
            }
        }
        return sym
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/15fb0841b626620bbb1d2c6db86cc78c">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/integer-to-roman/discuss/1144148/">
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

For example, <code>2</code> is written as <code>II</code> in Roman numeral, just two one's added together. <code>12</code> is written as <code>XII</code>, which is simply <code>X + II</code>. The number <code>27</code> is written as <code>XXVII</code>, which is <code>XX + V + II</code>.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not <code>IIII</code>. Instead, the number four is written as <code>IV</code>. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as <code>IX</code>. There are six instances where subtraction is used:

<ul>
<li><code>I</code> can be placed before <code>V</code> (5) and <code>X</code> (10) to make 4 and 9. </li>
<li><code>X</code> can be placed before <code>L</code> (50) and <code>C</code> (100) to make 40 and 90. </li>
<li><code>C</code> can be placed before <code>D</code> (500) and <code>M</code> (1000) to make 400 and 900.</li>
</ul>

Given an integer, convert it to a roman numeral.
</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> num = 3
<b>Output:</b> "III"
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> num = 4
<b>Output:</b> "IV"
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> num = 9
<b>Output:</b> "IX"
</pre>

<h4>Example 4</h4>

<pre>
<b>Input:</b> num = 58
<b>Output:</b> "LVIII"
<b>Explanation:</b> L = 50, V = 5, III = 3.
</pre>

<h4>Example 5</h4>

<pre>
<b>Input:</b> num = 1994
<b>Output:</b> "MCMXCIV"
<b>Explanation:</b> M = 1000, CM = 900, XC = 90 and IV = 4.
</pre>

<h4>Constraints</h4>

<ul>
<li>1 <= num <= 3999</li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/integer-to-roman/
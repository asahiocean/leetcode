<h1>
12. Integer to Roman
<img src="https://tinyurl.com/2p967t48" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    
    private let decimals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    private let numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    
    func intToRoman(_ num: Int) -> String {

        var num = num
        var result = ""

        while num > 0 {
            for (i, d) in decimals.enumerated() where num - d >= 0 {
                num -= d
                result += numerals[i]
                break
            }
        }
        return result
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

## Description

Roman numerals are represented by seven different symbols: ```I```, ```V```, ```X```, ```L```, ```C```, ```D``` and ```M```.

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

For example, ```2``` is written as ```II``` in Roman numeral, just two one's added together. ```12``` is written as ```XII```, which is simply ```X + II```. The number ```27``` is written as ```XXVII```, which is ```XX + V + II```.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not ```IIII```. Instead, the number four is written as ```IV```. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as ```IX```. There are six instances where subtraction is used:

* ```I``` can be placed before ```V``` (5) and ```X``` (10) to make 4 and 9. 
* ```X``` can be placed before ```L``` (50) and ```C``` (100) to make 40 and 90. 
* ```C``` can be placed before ```D``` (500) and ```M``` (1000) to make 400 and 900.

Given an integer, convert it to a roman numeral.

#### Example 1

<pre>
<b>Input:</b> num = 3
<b>Output:</b> "III"
</pre>

#### Example 2

<pre>
<b>Input:</b> num = 4
<b>Output:</b> "IV"
</pre>

#### Example 3

<pre>
<b>Input:</b> num = 9
<b>Output:</b> "IX"
</pre>

#### Example 4

<pre>
<b>Input:</b> num = 58
<b>Output:</b> "LVIII"
<b>Explanation:</b> L = 50, V = 5, III = 3.
</pre>

#### Example 5

<pre>
<b>Input:</b> num = 1994
<b>Output:</b> "MCMXCIV"
<b>Explanation:</b> M = 1000, CM = 900, XC = 90 and IV = 4.
</pre>

#### Constraints

* 1 <= num <= 3999

---

**Source:** https://leetcode.com/problems/integer-to-roman/
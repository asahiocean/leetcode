<h1>
29. Divide Two Integers
<img src="https://tinyurl.com/4ebs5dcx" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let negative = (dividend < 0) == (divisor < 0)
        var _dividend = Int64(abs(dividend))
        let _divisor = Int64(abs(divisor))
        
        var count = 0, t = 1, divisor = _divisor
        
        while divisor < _dividend {
            divisor = divisor << 1
            t = t << 1
        }
        
        while divisor > 0, divisor > _divisor {
            while divisor > _dividend {
                divisor = divisor >> 1
                t = t >> 1
            }
            _dividend -= divisor
            count += t
        }
        if _dividend == _divisor { count += 1 }
        return negative ? min(count, Int(Int32.max)) : max(-count, Int(Int32.min))
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/4469f699f72c2fff864db436f99407a8">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/divide-two-integers/discuss/1163652/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given two integers `dividend` and `divisor`, divide two integers **without** using multiplication, division, and mod operator.

The integer division should truncate toward zero, which means losing its fractional part. For example, `8.345` would be truncated to `8`, and `-2.7335` would be truncated to `-2`.

Return _the **quotient** after dividing_ `dividend` _by_ `divisor`.

**Note:** Assume we are dealing with an environment that could only store integers within the **32-bit** signed integer range: <code>[−2<sup>31</sup>, 2<sup>31</sup> − 1]</code>. For this problem, if the quotient is **strictly greater than** <code>2<sup>31</sup> - 1</code>, then return <code>2<sup>31</sup> - 1</code>, and if the quotient is **strictly less than** <code>-2<sup>31</sup></code>, then return <code>-2<sup>31</sup></code>.

#### Example 1

<pre>
<b>Input:</b> dividend = 10, divisor = 3
<b>Output:</b> 3
<b>Explanation:</b> 10/3 = 3.33333.. which is truncated to 3.
</pre>

#### Example 2

<pre>
<b>Input:</b> dividend = 7, divisor = -3
<b>Output:</b> -2
<b>Explanation:</b> 7/-3 = -2.33333.. which is truncated to -2.
</pre>

#### Constraints

* <code>-2<sup>31</sup> <= dividend, divisor <= 2<sup>31</sup> - 1</code>
* `divisor != 0`

---

**Source:** https://leetcode.com/problems/divide-two-integers/

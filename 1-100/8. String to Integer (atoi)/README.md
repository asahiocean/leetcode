<h1>
8. String to Integer (atoi)
<img src="https://tinyurl.com/2p8hcb6p" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func myAtoi(_ s: String) -> Int {
        if s.contains("+ ") { return 0 }
        let int = (s as NSString).integerValue
        return int >= Int32.max ? Int(Int32.max) : max(Int(Int32.min), int)
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/901d37282f6f291d9aa4f7d994689ed9">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/string-to-integer-atoi/discuss/1142211">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Implement the ```myAtoi(string s)``` function, which converts a string to a 32-bit signed integer (similar to C/C++'s ```atoi``` function).

The algorithm for ```myAtoi(string s)``` is as follows:

Read in and ignore any leading whitespace.
Check if the next character (if not already at the end of the string) is ```'-'``` or ```'+'```. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
Read in next the characters until the next non-digit charcter or the end of the input is reached. The rest of the string is ignored.
Convert these digits into an integer (i.e. ```"123" -> 123```, ```"0032" -> 32```). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
If the integer is out of the 32-bit signed integer range ```[-231, 231 - 1]```, then clamp the integer so that it remains in the range. Specifically, integers less than ```-231``` should be clamped to <code>-2<sup>31</sup></code>, and integers greater than <code>2<sup>31</sup> - 1</code> should be clamped to <code>2<sup>31</sup> - 1</code>.
Return the integer as the final result.

#### Note

* Only the space character ```' '``` is considered a whitespace character.
* Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.

#### Example 1

<pre>
<b>Input:</b> s = "42"
<b>Output:</b> 42
<b>Explanation:</b> The underlined characters are what is read in, the caret is the current reader position.
Step 1: "42" (no characters read because there is no leading whitespace)
         ^
Step 2: "42" (no characters read because there is neither a '-' nor '+')
         ^
Step 3: "42" ("42" is read in)
           ^
The parsed integer is 42.
Since 42 is in the range [-231, 231 - 1], the final result is 42.
</pre>

#### Example 2

<pre>
<b>Input:</b> s = "   -42"
<b>Output:</b> -42
<b>Explanation:</b>
Step 1: "   -42" (leading whitespace is read and ignored)
            ^
Step 2: "   -42" ('-' is read, so the result should be negative)
             ^
Step 3: "   -42" ("42" is read in)
               ^
The parsed integer is -42.
Since -42 is in the range [-231, 231 - 1], the final result is -42.
</pre>

#### Example 3

<pre>
<b>Input:</b> s = "4193 with words"
<b>Output:</b> 4193
<b>Explanation:</b>
Step 1: "4193 with words" (no characters read because there is no leading whitespace)
         ^
Step 2: "4193 with words" (no characters read because there is neither a '-' nor '+')
         ^
Step 3: "4193 with words" ("4193" is read in; reading stops because the next character is a non-digit)
             ^
The parsed integer is 4193.
Since 4193 is in the range [-231, 231 - 1], the final result is 4193.
</pre>

#### Example 4

<pre>
<b>Input:</b> s = "words and 987"
<b>Output:</b> 0
<b>Explanation:</b>
Step 1: "words and 987" (no characters read because there is no leading whitespace)
         ^
Step 2: "words and 987" (no characters read because there is neither a '-' nor '+')
         ^
Step 3: "words and 987" (reading stops immediately because there is a non-digit 'w')
         ^
The parsed integer is 0 because no digits were read.
Since 0 is in the range [-231, 231 - 1], the final result is 0.
</pre>

#### Example 5

<pre>
<b>Input:</b> s = "-91283472332"
<b>Output:</b> -2147483648
<b>Explanation:</b>
Step 1: "-91283472332" (no characters read because there is no leading whitespace)
         ^
Step 2: "-91283472332" ('-' is read, so the result should be negative)
          ^
Step 3: "-91283472332" ("91283472332" is read in)
                     ^
The parsed integer is -91283472332.
Since -91283472332 is less than the lower bound of the range [-231, 231 - 1], the final result is clamped to -231 = -2147483648.
</pre>

#### Constraints

* ```0 <= s.length <= 200```
* ```s``` consists of English letters (lower-case and upper-case), digits (0-9), ```' '```, ```'+'```, ```'-'```, and ```'.'```.

---

**Source:** https://leetcode.com/problems/string-to-integer-atoi/
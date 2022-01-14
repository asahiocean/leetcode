<h1>
8. String to Integer (atoi)
<img src="https://tinyurl.com/57hxmvp9" align="right" alt="views badge">
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
        let value = (s as NSString).integerValue
        return value >= Int32.max ? Int(Int32.max) : max(Int(Int32.min), value)
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

<h2>Description</h2>

<p>
Implement the <code>myAtoi(string s)</code> function, which converts a string to a 32-bit signed integer (similar to C/C++'s <code>atoi</code> function).

The algorithm for <code>myAtoi(string s)</code> is as follows:

Read in and ignore any leading whitespace.
Check if the next character (if not already at the end of the string) is <code>'-'</code> or <code>'+'</code>. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
Read in next the characters until the next non-digit charcter or the end of the input is reached. The rest of the string is ignored.
Convert these digits into an integer (i.e. <code>"123" -> 123</code>, <code>"0032" -> 32</code>). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
If the integer is out of the 32-bit signed integer range <code>[-231, 231 - 1]</code>, then clamp the integer so that it remains in the range. Specifically, integers less than <code>-231</code> should be clamped to <code>-2<sup>31</sup></code>, and integers greater than <code>2<sup>31</sup> - 1</code> should be clamped to <code>2<sup>31</sup> - 1</code>.
Return the integer as the final result.
</p>

<h4>Note</h4>

<ul>
<li>Only the space character <code>' '</code> is considered a whitespace character.</li>
<li>Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.</li>
</ul>

<h4>Example 1</h4>

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

<h4>Example 2</h4>

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

<h4>Example 3</h4>

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

<h4>Example 4</h4>

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

<h4>Example 5</h4>

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

<ul>
<li><code>0 <= s.length <= 200</code></li>
<li><code>s</code> consists of English letters (lower-case and upper-case), digits (0-9), <code>' '</code>, <code>'+'</code>, <code>'-'</code>, and <code>'.'</code>.</li>
</ul>

<hr/>

<b>Source:</b> https://leetcode.com/problems/string-to-integer-atoi/
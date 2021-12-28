<h1>
20. Valid Parentheses
<img src="https://tinyurl.com/ms3zarfd" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func isValid(_ s: String) -> Bool {
        
        if s.count % 2 != 0 { return false }
        var stack: [Character] = []
        
        for ch in s {
            switch ch {
            case "(": stack.append(")")
            case "[": stack.append("]")
            case "{": stack.append("}")
            default:
                if stack.isEmpty || stack.removeLast() != ch {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/04f7472130b46aeb8df2236f619826bd">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/valid-parentheses/discuss/1644155/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given a string ```s``` containing just the characters ```'('```, ```')'```, ```'{'```, ```'}'```, ```'['``` and ```']'```, determine if the input string is valid.

An input string is valid if:
1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.

#### Example 1

<pre>
<b>Input:</b> s = "()"
<b>Output:</b> true
</pre>

#### Example 2

<pre>
<b>Input:</b> s = "()[]{}"
<b>Output:</b> true
</pre>

#### Example 3

<pre>
<b>Input:</b> s = "(]"
<b>Output:</b> false
</pre>

#### Example 4

<pre>
<b>Input:</b> s = "([)]"
<b>Output:</b> false
</pre>

#### Example 5

<pre>
<b>Input:</b> s = "{[]}"
<b>Output:</b> true
</pre>

#### Constraints

* `1 <= s.length <= 104`
* `s` consists of parentheses only ```'()[]{}'```.

---

**Source:** https://leetcode.com/problems/valid-parentheses/

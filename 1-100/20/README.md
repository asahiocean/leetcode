<h1>
20. Valid Parentheses
<img src="https://tinyurl.com/yzz2u7zw" align="right" alt="views badge">
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
        
        guard s.count % 2 == 0 else { return false }
        
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

<h2>Description</h2>

<p>
Given a string <code>s</code> containing just the characters <code>'('</code>, <code>')'</code>, <code>'{'</code>, <code>'}'</code>, <code>'['</code> and <code>']'</code>, determine if the input string is valid.

An input string is valid if:
1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.
</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> s = "()"
<b>Output:</b> true
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> s = "()[]{}"
<b>Output:</b> true
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> s = "(]"
<b>Output:</b> false
</pre>

<h4>Example 4</h4>

<pre>
<b>Input:</b> s = "([)]"
<b>Output:</b> false
</pre>

<h4>Example 5</h4>

<pre>
<b>Input:</b> s = "{[]}"
<b>Output:</b> true
</pre>

<h4>Constraints</h4>

<ul>
<li><code>1 <= s.length <= 104</code></li>
<li><code>s</code> consists of parentheses only <code>'()[]{}'</code>.</li>
</ul>

<hr/>

<b>Source:</b> https://leetcode.com/problems/valid-parentheses/

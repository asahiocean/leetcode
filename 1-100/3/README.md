<h1>
3. Longest Substring Without Repeating Characters
<img src="https://tinyurl.com/2p95nu4z" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        var len = 0
        var chars: [Character] = []
        
        for ch in s {
            if chars.contains(ch), let idx = chars.firstIndex(of: ch) {
                chars.removeSubrange(0...idx)
            }
            chars.append(ch)
            len = max(len, chars.count)
        }
        return len
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/d4238b12100354cc2381ddace2d16632">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/longest-substring-without-repeating-characters/discuss/1134880">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

Given a string `s`, find the length of the **longest substring** without repeating characters.

<h4>Example 1</h4>

<pre>
<b>Input:</b> s = "abcabcbb"
<b>Output:</b> 3
<b>Explanation:</b> The answer is "abc", with the length of 3.
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> s = "bbbbb"
<b>Output:</b> 1
<b>Explanation:</b> The answer is "b", with the length of 1.
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> s = "pwwkew"
<b>Output:</b> 3
<b>Explanation:</b> The answer is "wke", with the length of 3.
Notice that the answer must be a substring, <b>"pwke"</b> is a subsequence and not a substring.
</pre>

<h4>Example 4</h4>

<pre>
<b>Input:</b> s = ""
<b>Output:</b> 0
</pre>

<h4>Constraints</h4>

<ul>
<li><code>0 <= s.length <= 5 * 104</code></li>
<li><code>s</code> consists of English letters, digits, symbols and spaces.</li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/longest-substring-without-repeating-characters/
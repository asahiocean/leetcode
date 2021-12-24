<h1>
3. Longest Substring Without Repeating Characters
<img src="https://tinyurl.com/yckwupmn" align="right" alt="views badge">
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
        var length = 0, chars = [Character]()
        for ch in s {
            if chars.contains(ch), let fi = chars.firstIndex(of: ch) {
                chars.removeSubrange(0...fi)
            }
            chars.append(ch)
            length = max(length, chars.count)
        }
        return length
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

## Description

Given a string ```s```, find the length of the **longest substring** without repeating characters.

#### Example 1

```
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
```

#### Example 2

```
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
```

#### Example 3

```
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
```

#### Example 4

```
Input: s = ""
Output: 0
```

#### Constraints

```
0 <= s.length <= 5 * 104
s consists of English letters, digits, symbols and spaces.
```

---

**Source:** https://leetcode.com/problems/longest-substring-without-repeating-characters/

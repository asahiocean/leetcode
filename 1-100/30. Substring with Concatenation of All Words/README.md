<h1>
30. Substring with Concatenation of All Words
<img src="https://tinyurl.com/2p8btbnz" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard !(s.isEmpty) || !(words.isEmpty) else { return [] }
        
        let lenS = s.count, chars = Array(s)
        let size = words[0].count, count = words.count * size
        
        guard lenS >= count else { return [] }
        
        var wordDict = [[Character]:Int]()
        
        for word in words {
            let arr: [Character] = word.map({$0})
            wordDict[arr, default: 0] = (wordDict[arr] ?? 0) + 1
        }
        
        var result = [Int]()
        
        for i in 0..<size {
            var val = i
            while val <= (lenS - count) {
                var diff = (val + count)
                var dict = [[Character]:Int]()
                var equal: Bool = true
                while val < diff {
                    let temp: [Character] = chars[(diff - size)..<diff].map({$0})
                    dict[temp] = (dict[temp] ?? 0) + 1
                    if let char = dict[temp], char > (wordDict[temp] ?? 0) {
                        equal = false
                        break
                    }
                    diff -= size
                }
                if dict == wordDict { result.append(val) }
                if equal { val += size } else { val = diff }
            }
        }
        return result
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/7217f24f901eeab1cc676bebe093e69e">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/substring-with-concatenation-of-all-words/discuss/1349245/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

You are given a string `s` and an array of strings `words` of **the same length**. Return all starting indices of substring(s) in `s` that is a concatenation of each word in `words` **exactly once**, **in any order**, and **without any intervening characters**.

You can return the answer in **any order**.

#### Example 1

<pre>
<b>Input:</b> s = "barfoothefoobarman", words = ["foo","bar"]
<b>Output:</b> [0,9]
<b>Explanation:</b> Substrings starting at index 0 and 9 are "barfoo" and "foobar" respectively.
The output order does not matter, returning [9,0] is fine too.
</pre>

#### Example 2

<pre>
<b>Input:</b> s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
<b>Output:</b> []
</pre>

#### Example 3

<pre>
<b>Input:</b> s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
<b>Output:</b> [6,9,12]
</pre>

#### Constraints

* <code>1 <= s.length <= 10<sup>4</sup></code>
* `s` consists of lower-case English letters.
* `1 <= words.length <= 5000`
* `1 <= words[i].length <= 30`
* `words[i]` consists of lower-case English letters.

---

**Source:** https://leetcode.com/problems/substring-with-concatenation-of-all-words/

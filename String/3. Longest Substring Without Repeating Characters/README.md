# [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

Given a string ```s```, find the length of the **longest substring** without repeating characters.

#### Example 1:
```swift
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
```

#### Example 2:
```swift
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
```

#### Example 3:
```swift
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
```

#### Example 4:
```swift
Input: s = ""
Output: 0
```

#### Constraints:
```swift
0 <= s.length <= 5 * 104
s consists of English letters, digits, symbols and spaces.
```

#### Solution
```swift
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var length = 0, chars = [Character]()
        s.forEach({
            if chars.contains($0) {
                chars.removeSubrange(0...chars.firstIndex(of: $0)!)
            }
            chars.append($0)
            length = max(length, chars.count)
        })
        return length
    }
}
```

#### [Discuss](https://leetcode.com/problems/longest-substring-without-repeating-characters/discuss/1134880/Swift%3A-Longest-Substring-Without-Repeating-Characters)
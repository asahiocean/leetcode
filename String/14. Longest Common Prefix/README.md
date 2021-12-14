# [14. Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/)

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string ```""```.

#### Example 1:
```swift
Input: strs = ["flower","flow","flight"]
Output: "fl"
```
#### Example 2:
```swift
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
``` 

#### Constraints:
```swift
0 <= strs.length <= 200
0 <= strs[i].length <= 200
strs[i] consists of only lower-case English letters.
```

### Solution:
```swift
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        var common = strs[0]
        strs.forEach({
            while !$0.hasPrefix(common) {
                common = String(common.dropLast())
            }
        })
        return common
    }
}
```
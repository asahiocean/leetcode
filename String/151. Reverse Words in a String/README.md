# [151. Reverse Words in a String](https://leetcode.com/problems/reverse-words-in-a-string/)

Given an input string ```s```, reverse the order of the **words**.

A **word** is defined as a sequence of non-space characters. The **words** in ```s``` will be separated by at least one space.

*Return a string of the words in reverse order concatenated by a single space.*

**Note** that ```s``` may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

#### Example 1:
```swift
Input: s = "the sky is blue"
Output: "blue is sky the"
```
#### Example 2:
```swift
Input: s = "  hello world  "
Output: "world hello"
Explanation: Your reversed string should not contain leading or trailing spaces.
```

#### Example 3:
```swift
Input: s = "a good   example"
Output: "example good a"
Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
```

#### Example 4:
```swift
Input: s = "  Bob    Loves  Alice   "
Output: "Alice Loves Bob"
```

#### Example 5:
```swift
Input: s = "Alice does not even like bob"
Output: "bob like even not does Alice"
```

#### Constraints:
```swift
1 <= s.length <= 104
s contains English letters (upper-case and lower-case), digits, and spaces ' '.
There is at least one word in s.
```

### Solution
```swift
class Solution {
    func reverseWords(_ s: String) -> String {
        s.split(separator: " ").reversed().joined(separator: " ")
    }
}
```
### Tests
```swift
func tests() {
    let s = Solution()
    assert(s.reverseWords("the sky is blue") == "blue is sky the") // good
    assert(s.reverseWords("  hello world  ") == "world hello") // good
    assert(s.reverseWords("a good   example") == "example good a") // good
    assert(s.reverseWords("  Bob    Loves  Alice   ") == "Alice Loves Bob") // good
    assert(s.reverseWords("Alice does not even like bob") == "bob like even not does Alice") // good
}

tests()
```

##### [Discuss](https://leetcode.com/problems/reverse-words-in-a-string/discuss/1126820/Swift%3A-Reverse-Words-in-a-String)

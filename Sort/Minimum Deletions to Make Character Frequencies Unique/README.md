## [1647. Minimum Deletions to Make Character Frequencies Unique](https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique/)

[Discuss](https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique/discuss/1122198/Swift-solution)

<hr>

A string ```s``` is called **good** if there are no two different characters in ```s``` that have the same **frequency**.

Given a string ```s```, return the **minimum** number of characters you need to delete to make ```s``` **good**.

The **frequency** of a character in a string is the number of times it appears in the string. For example, in the string ```"aab"```, the **frequency** of ```'a'``` is ```2```, while the **frequency** of ```'b'``` is ```1```.

#### Example 1:
```swift
Input: s = "aab"
Output: 0
Explanation: s is already good.
```

#### Example 2:
```swift
Input: s = "aaabbbcc"
Output: 2
Explanation: You can delete two 'b's resulting in the good string "aaabcc".
Another way it to delete one 'b' and one 'c' resulting in the good string "aaabbc".
```

#### Example 3:
```swift
Input: s = "ceabaacb"
Output: 2
Explanation: You can delete both 'c's resulting in the good string "eabaab".
Note that we only care about characters that are still in the string at the end (i.e. frequency of 0 is ignored).
```

#### Constraints:
```swift
1 <= s.length <= 105
s contains only lowercase English letters.
```

### [Solution](https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique/discuss/1122198/Swift-solution)
```swift
import Foundation

class Solution {
    func minDeletions(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        
        var count: Int = 0
        
        var dict: [Character:Int] = [:]
        s.forEach({ dict[$0, default: 0] += 1 })
        
        var set: Set<Int> = []
        dict.forEach({
            guard var value = dict[$0.key] else { return }
            while set.contains(value) {
                value -= 1
                count += 1
            }
            if value > 0 { set.insert(value) }
        })
        return count
    }
}

func tests() {
    let s = Solution()
    assert(s.minDeletions("aab") == 0) // good
    assert(s.minDeletions("aaabbbcc") == 2) // good
    assert(s.minDeletions("ceabaacb") == 2) // good
}

tests()
```

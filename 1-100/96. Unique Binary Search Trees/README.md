# [96. Unique Binary Search Trees](https://leetcode.com/problems/unique-binary-search-trees/)

Given an integer ```n```, return the number of structurally unique **BST**'s (binary search trees) which has exactly ```n``` nodes of unique values from ```1``` to ```n```.

#### Example 1:
![](https://assets.leetcode.com/uploads/2021/01/18/uniquebstn3.jpg)
```swift
Input: n = 3
Output: 5
```

#### Example 2:
```swift
Input: n = 1
Output: 1
```

#### Constraints:
```swift
1 <= n <= 19
```
### Solution:
```swift
class Solution {
    func numTrees(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        
        var arr: [Int] = .init(repeating: 0, count: n + 1)
        arr[0] = 1; arr[1] = 1
        
        for i in 2...n where n >= 2 {
            for j in 0..<i {
                arr[i] += arr[j] * arr[i - 1 - j]
            }
        }
        return arr[n]
    }
}
```

### Tests:
```swift
func tests() {
    let s = Solution()
    assert(s.numTrees(3) == 5)
    assert(s.numTrees(1) == 1)
}

tests()
```
### [1. Two Sum](https://leetcode.com/problems/two-sum/)

**[Solution](https://git.io/JEYEW) • [Pastebin](https://pastebin.com/dmceS55U)**

---

Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

#### Example 1:
```swift
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Output: Because nums[0] + nums[1] == 9, we return [0, 1].
```

#### Example 2:
```swift
Input: nums = [3,2,4], target = 6
Output: [1,2]
```

#### Example 3:
```swift
Input: nums = [3,3], target = 6
Output: [0,1]
```

#### Constraints:
```swift
2 <= nums.length <= 103
-109 <= nums[i] <= 109
-109 <= target <= 109
Only one valid answer exists.
```

### Solution
```swift
import Foundation

// https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for (i, num) in nums.enumerated() {
            if let last = dict[target - num] {
                return [last, i]
            }
            dict[num] = i
        }
        return []
    }
}

func tests() {
    let s = Solution()
    assert(s.twoSum([2,7,11,15], 9) == [0,1])
    assert(s.twoSum([3,2,4], 6) == [1,2])
    assert(s.twoSum([3,3], 6) == [0,1])
}

tests()
```

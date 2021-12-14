### [217. Contains Duplicate](https://leetcode.com/problems/contains-duplicate/)

Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

#### Example 1:
```swift
Input: nums = [1,2,3,1]
Output: true
```

#### Example 2:
```swift
Input: nums = [1,2,3,4]
Output: false
```

#### Example 3:
```swift
Input: nums = [1,1,1,3,3,4,3,2,4,2]
Output: true
```

#### Constraints:
```swift
1 <= nums.length <= 105
-109 <= nums[i] <= 109
```

### Solution
```swift
import Foundation

// https://leetcode.com/problems/contains-duplicate/

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return nums.count > Set(nums).count
    }
}

func tests() {
    let s = Solution()
    assert(s.containsDuplicate([1,2,3,1]))
    assert(!s.containsDuplicate([1,2,3,4])) // false
    assert(s.containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
}

tests()
```

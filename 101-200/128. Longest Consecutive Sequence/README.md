# [128. Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/)

Given an unsorted array of integers ```nums```, return the **length** of the **longest** consecutive elements sequence.

### Example 1:
```swift
Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
```

### Example 2:
```swift
Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9
```

### Constraints:
```swift
0 <= nums.length <= 104
-109 <= nums[i] <= 109
```

### Solution:
```swift
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        let sorted = Set(nums).sorted()
        var long = 0, count = 1, i = 0
        
        while i < sorted.count {
            if i - 1 >= 0, sorted[i-1] == sorted[i] - 1 {
                count += 1
            } else {
                long = max(count, long)
                count = 1
            }
            i += 1
        }
        long = max(count, long)
        return long
    }
}
```

### Tests:
```swift
import XCTest

class Tests: XCTestCase {
    private let s = Solution()
    
    func testExample1() {
        XCTAssertEqual(s.longestConsecutive([100,4,200,1,3,2]), 4) // good
    }
    
    func testExample2() {
        XCTAssertEqual(s.longestConsecutive([0,3,7,2,5,8,4,6,0,1]), 9) // good
    }
}

Tests.defaultTestSuite.run()
```
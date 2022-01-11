import Foundation

// 167. Two Sum II - Input Array Is Sorted
// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        let len = numbers.count
        guard len > 1 else { return [] }
        var left = 0, right = len - 1
        while left < right {
            switch numbers[left] + numbers[right] {
            case let val where val < target:
                left += 1
            case let val where val > target:
                right -= 1
            default:
                return [left + 1, right + 1]
            }
        }
        return []
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
    func test0() {
        let value = solution.twoSum([2,7,11,15], 9)
        XCTAssertEqual(value, [1,2])
    }
    
    // The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].
    func test1() {
        let value = solution.twoSum([2,3,4], 6)
        XCTAssertEqual(value, [1,3])
    }
    
    // The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].
    func test2() {
        let value = solution.twoSum([-1,0], -1)
        XCTAssertEqual(value, [1,2])
    }
}

Tests.defaultTestSuite.run()

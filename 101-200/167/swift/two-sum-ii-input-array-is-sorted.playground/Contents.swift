import Foundation

// 167. Two Sum II - Input Array Is Sorted
// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

class Solution {
    func twoSum(_ n: [Int], _ t: Int) -> [Int] {
        var lhs = 0, rhs = n.count - 1
        while lhs < rhs {
            let sum = n[lhs] + n[rhs]
            if sum < t {
                lhs += 1
            } else if sum > t {
                rhs -= 1
            } else {
                return [lhs + 1, rhs + 1]
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

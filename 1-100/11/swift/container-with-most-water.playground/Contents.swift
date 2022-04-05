import Foundation

// 11. Container With Most Water
// https://leetcode.com/problems/container-with-most-water/

class Solution {
    func maxArea(_ h: [Int]) -> Int {
        guard h.count > 2 else { return min(h[0], h[1]) }
        var val = 0, lhs = 0, rhs = h.count - 1
        while lhs < rhs {
            val = max(val, min(h[lhs], h[rhs]) * (rhs - lhs))
            h[lhs] < h[rhs] ? (lhs += 1) : (rhs -= 1)
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7].
    // In this case, the max area of water (blue section) the container can contain is 49.
    func test0() {
        let value = solution.maxArea([1,8,6,2,5,4,8,3,7])
        XCTAssertEqual(value, 49)
    }
    
    func test1() {
        let value = solution.maxArea([1,1])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()

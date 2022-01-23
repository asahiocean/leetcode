import Foundation

// 1217. Minimum Cost to Move Chips to The Same Position
// https://leetcode.com/problems/minimum-cost-to-move-chips-to-the-same-position/

class Solution {
    func minCostToMoveChips(_ position: [Int]) -> Int {
        var even = 0, odd = 0
        for p in position { p % 2 == 0 ? (even += 1) : (odd += 1) }
        return odd > even ? even : odd
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // First step: Move the chip at position 3 to position 1 with cost = 0.
    // Second step: Move the chip at position 2 to position 1 with cost = 1.
    // Total cost is 1.
    func test0() {
        let value = solution.minCostToMoveChips([1,2,3])
        XCTAssertEqual(value, 1)
    }
    
    // We can move the two chips at position  3 to position 2. Each move has cost = 1. The total cost = 2.
    func test1() {
        let value = solution.minCostToMoveChips([2,2,2,3,3])
        XCTAssertEqual(value, 2)
    }
    
    func test2() {
        let value = solution.minCostToMoveChips([1,1000000000])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 441. Arranging Coins
// https://leetcode.com/problems/arranging-coins/

class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var lhs = 0, rhs = n
        while lhs <= rhs {
            let num = (rhs + lhs) / 2
            let mid = num * (num + 1) / 2
            if mid == n { return num }
            n < mid ? (rhs = num - 1) : (lhs = num + 1)
        }
        return rhs
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Because the 3rd row is incomplete, we return 2.
    func test0() {
        let value = solution.arrangeCoins(5)
        XCTAssertEqual(value, 2)
    }
    
    // Because the 4th row is incomplete, we return 3.
    func test1() {
        let value = solution.arrangeCoins(8)
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()

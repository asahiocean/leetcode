import Foundation

// 367. Valid Perfect Square
// https://leetcode.com/problems/valid-perfect-square/

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        guard num > 1 else { return true }
        var val = 1
        while val * val <= num {
            if num % val == 0, num / val == val {
                return true
            }
            val += 1
        }
        return false
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    func test0() {
        let value = solution.isPerfectSquare(16)
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.isPerfectSquare(14)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()

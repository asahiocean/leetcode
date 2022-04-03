import Foundation

// 69. Sqrt(x)
// https://leetcode.com/problems/sqrtx/

class Solution {
    func mySqrt(_ x: Int) -> Int {
        return Int(sqrt(Double(x)))
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    private let solution = Solution()
    
    func test0() {
        let value = solution.mySqrt(4)
        XCTAssertEqual(value, 2)
    }
    
    // The square root of 8 is 2.82842..., and since the decimal part is truncated, 2 is returned.
    func test1() {
        let value = solution.mySqrt(8)
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 69. Sqrt(x)
// https://leetcode.com/problems/sqrtx/

class Solution {
    func mySqrt(_ x: Int) -> Int {
        return Int(sqrt(Double(x)))
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        XCTAssertEqual(s.mySqrt(4), 2)
    }
    func test1() {
        XCTAssertEqual(s.mySqrt(8), 2)
    }
}

Tests.defaultTestSuite.run()

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
    private let solution = Solution()
    
    func test0() {
        let value = solution.mySqrt(4)
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.mySqrt(8)
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()

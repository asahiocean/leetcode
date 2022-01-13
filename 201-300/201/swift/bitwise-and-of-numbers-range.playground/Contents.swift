import Foundation

// 201. Bitwise AND of Numbers Range
// https://leetcode.com/problems/bitwise-and-of-numbers-range/

class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        guard right - left > 1 else { return left & right }
        let value = right & (right - 1)
        guard value >= left else { return value }
        return rangeBitwiseAnd(left, value)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.rangeBitwiseAnd(5, 7)
        XCTAssertEqual(value, 4)
    }
    
    func test1() {
        let value = solution.rangeBitwiseAnd(0, 0)
        XCTAssertEqual(value, 0)
    }
    
    func test2() {
        let value = solution.rangeBitwiseAnd(1, 2147483647)
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

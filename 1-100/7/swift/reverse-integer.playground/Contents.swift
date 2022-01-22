import Foundation

// 7. Reverse Integer
// https://leetcode.com/problems/reverse-integer/

class Solution {
    func reverse(_ x: Int) -> Int {
        var res = 0, valX = x
        while valX != 0 {
            res = res * 10
            res = res + (valX % 10)
            valX /= 10
        }
        return res < Int32.min || res > Int32.max ? 0 : res
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.reverse(123)
        XCTAssertEqual(value, 321)
    }
    
    func test1() {
        let value = solution.reverse(-123)
        XCTAssertEqual(value, -321)
    }
    
    func test2() {
        let value = solution.reverse(120)
        XCTAssertEqual(value, 21)
    }
}

Tests.defaultTestSuite.run()

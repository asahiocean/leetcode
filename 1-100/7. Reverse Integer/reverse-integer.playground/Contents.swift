import Foundation

// 7. Reverse Integer
// https://leetcode.com/problems/reverse-integer/

class Solution {
    func reverse(_ x: Int) -> Int {
        var r = 0, x = x
        while x != 0 {
            r = r * 10
            r = r + (x % 10)
            x /= 10
        }
        return r < Int32.min || r > Int32.max ? 0 : r
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

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
    func test3() {
        let value = solution.reverse(0)
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

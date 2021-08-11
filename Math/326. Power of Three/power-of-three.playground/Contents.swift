import Foundation

// 326. Power of Three
// https://leetcode.com/problems/power-of-three

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        var num = n
        if n < 1 { return false }
        while num % 3 == 0 { num = num / 3 }
        guard num != 1 else { return true }
        return false
    }
}

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        XCTAssertEqual(s.isPowerOfThree(27), true)
    }
    func test1() {
        XCTAssertEqual(s.isPowerOfThree(0), false)
    }
    func test2() {
        XCTAssertEqual(s.isPowerOfThree(9), true)
    }
    func test3() {
        XCTAssertEqual(s.isPowerOfThree(45), false)
    }
}

Tests.defaultTestSuite.run()

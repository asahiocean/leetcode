import Foundation

// 476. Number Complement
// https://leetcode.com/problems/number-complement/

class Solution {
    func findComplement(_ num: Int) -> Int {
        var n = 1
        while n <= num { n <<= 1 }
        return (n - 1) ^ num
    }
}

// MARK: - Test Cases -

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        XCTAssertEqual(s.findComplement(5), 2)
    }
    func test1() {
        XCTAssertEqual(s.findComplement(1), 0)
    }
}

Tests.defaultTestSuite.run()

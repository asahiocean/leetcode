import Foundation

// 258. Add Digits
// https://leetcode.com/problems/add-digits/

class Solution {
    func addDigits(_ num: Int) -> Int {
        return num < 10 ? num : (num % 9 == 0 ? 9 : num % 9)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The process is
    // 38 --> 3 + 8 --> 11
    // 11 --> 1 + 1 --> 2
    // Since 2 has only one digit, return it.
    func test0() {
        let value = solution.addDigits(38)
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.addDigits(0)
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

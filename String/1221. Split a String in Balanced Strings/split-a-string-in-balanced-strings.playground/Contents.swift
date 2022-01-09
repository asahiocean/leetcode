import Foundation

// 1221. Split a String in Balanced Strings
// https://leetcode.com/problems/split-a-string-in-balanced-strings/

class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        var bal = 0, value = 0
        for ch in s {
            bal += ch == "R" ? 1 : -1
            bal == 0 ? value += 1 : nil
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.030 (0.032) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.balancedStringSplit("RLRRLLRLRL")
        XCTAssertEqual(value, 4)
    }
    
    func test1() {
        let value = solution.balancedStringSplit("RLLLLRRRLR")
        XCTAssertEqual(value, 3)
    }
    
    func test2() {
        let value = solution.balancedStringSplit("LLLLRRRR")
        XCTAssertEqual(value, 1)
    }
    
    func test3() {
        let value = solution.balancedStringSplit("RLRRRLLRLL")
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()

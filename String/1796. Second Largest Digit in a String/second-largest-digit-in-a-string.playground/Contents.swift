import Foundation

// 1796. Second Largest Digit in a String
// https://leetcode.com/problems/second-largest-digit-in-a-string/

class Solution {
    func secondHighest(_ s: String) -> Int {
        let set = Set(s.compactMap { $0.wholeNumberValue }).sorted(by: >)
        return set.count > 1 ? set[1] : -1
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.039 (0.043) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test1() {
        let value = solution.secondHighest("dfa12321afd")
        XCTAssertEqual(value, 2)
    }
    
    func test2() {
        let value = solution.secondHighest("abc1111")
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()

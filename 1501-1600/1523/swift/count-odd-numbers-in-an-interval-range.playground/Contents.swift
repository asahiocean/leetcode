import Foundation

// 1523. Count Odd Numbers in an Interval Range
// https://leetcode.com/problems/count-odd-numbers-in-an-interval-range/

class Solution {
    func countOdds(_ low: Int, _ high: Int) -> Int {
        let val = (high - low) + 1
        return (val / 2) + (val % 2 != 0 && low % 2 == 1 ? 1 : 0)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The odd numbers between 3 and 7 are [3,5,7].
    func test0() {
        let value = solution.countOdds(3, 7)
        XCTAssertEqual(value, 3)
    }
    
    // The odd numbers between 8 and 10 are [9].
    func test1() {
        let value = solution.countOdds(8, 10)
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()

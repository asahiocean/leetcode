import Foundation

// 1288. Remove Covered Intervals
// https://leetcode.com/problems/remove-covered-intervals/

class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted(by: { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] })
        
        var value = 0, next = 0
        
        for i in sorted where i[1] > next {
            next = i[1]
            value += 1
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Interval [3,6] is covered by [2,8], therefore it is removed.
    func test0() {
        let value = solution.removeCoveredIntervals([[1,4],[3,6],[2,8]])
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.removeCoveredIntervals([[1,4],[2,3]])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 1732. Find the Highest Altitude
// https://leetcode.com/problems/find-the-highest-altitude/

class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var cur = 0, res = 0
        gain.forEach { cur += $0; res = max(res, cur) }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.largestAltitude([-5,1,5,0,-7])
        XCTAssertEqual(value, 1)
    }
    func test1() {
        let value = solution.largestAltitude([-4,-3,-2,-1,4,3,2])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

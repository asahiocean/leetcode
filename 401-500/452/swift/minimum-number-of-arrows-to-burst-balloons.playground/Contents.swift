import Foundation

// 452. Minimum Number of Arrows to Burst Balloons
// https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/

class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        
        guard !(points.isEmpty) else { return 0 }
        
        let sorted = points.sorted(by: {$0[1] < $1[1]})
        
        var value = 1
        var pos = sorted[0][1]
        
        for i in 0..<sorted.count where sorted[i][0] > pos {
            value += 1
            pos = sorted[i][1]
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The balloons can be burst by 2 arrows:
    // - Shoot an arrow at x = 6, bursting the balloons [2,8] and [1,6].
    // - Shoot an arrow at x = 11, bursting the balloons [10,16] and [7,12].
    func test0() {
        let value = solution.findMinArrowShots([[10,16],[2,8],[1,6],[7,12]])
        XCTAssertEqual(value, 2)
    }
    
    // One arrow needs to be shot for each balloon for a total of 4 arrows.
    func test1() {
        let value = solution.findMinArrowShots([[1,2],[3,4],[5,6],[7,8]])
        XCTAssertEqual(value, 4)
    }
    
    // The balloons can be burst by 2 arrows:
    // - Shoot an arrow at x = 2, bursting the balloons [1,2] and [2,3].
    // - Shoot an arrow at x = 4, bursting the balloons [3,4] and [4,5].
    func test2() {
        let value = solution.findMinArrowShots([[1,2],[2,3],[3,4],[4,5]])
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()

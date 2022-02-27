import Foundation

// 1779. Find Nearest Point That Has the Same X or Y Coordinate
// https://leetcode.com/problems/find-nearest-point-that-has-the-same-x-or-y-coordinate/

class Solution {
    func nearestValidPoint(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
        var val = (idx: -1, dist: Int.max)
        for i in 0..<points.count {
            let val0 = points[i][0], val1 = points[i][1]
            guard val0 == x || val1 == y else { continue }
            let dist = abs(val0 != x ? val0 - x : val1 - y)
            if dist < val.dist { val = (i, dist) }
        }
        return val.idx
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Of all the points, only [3,1], [2,4] and [4,4] are valid.
    // Of the valid points, [2,4] and [4,4] have the smallest Manhattan distance from
    // your current location, with a distance of 1. [2,4] has the smallest index, so return 2.
    func test0() {
        let value = solution.nearestValidPoint(3, 4, [[1,2],[3,1],[2,4],[2,3],[4,4]])
        XCTAssertEqual(value, 2)
    }
    
    // The answer is allowed to be on the same location as your current location.
    func test1() {
        let value = solution.nearestValidPoint(3, 4, [[3,4]])
        XCTAssertEqual(value, 0)
    }
    
    // There are no valid points.
    func test2() {
        let value = solution.nearestValidPoint(3, 4, [[2,3]])
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()

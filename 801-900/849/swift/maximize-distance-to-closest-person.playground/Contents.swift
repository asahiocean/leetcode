import Foundation

// 849. Maximize Distance to Closest Person
// https://leetcode.com/problems/maximize-distance-to-closest-person/

class Solution {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        var last = -1, dist = 0
        
        for (i, seat) in seats.enumerated() where seat == 1 {
            dist = max(dist, last == -1 ? i : (i - last) / 2)
            last = i
        }
        dist = max(dist, seats.count - last - 1)
        return dist
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.018 (0.020) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // If Alex sits in the second open seat (i.e. seats[2]), then the closest person has distance 2.
    // If Alex sits in any other open seat, the closest person has distance 1.
    // Thus, the maximum distance to the closest person is 2.
    func test0() {
        let value = solution.maxDistToClosest([1,0,0,0,1,0,1])
        XCTAssertEqual(value, 2)
    }
    
    // If Alex sits in the last seat (i.e. seats[3]), the closest person is 3 seats away.
    // This is the maximum distance possible, so the answer is 3.
    func test1() {
        let value = solution.maxDistToClosest([1,0,0,0])
        XCTAssertEqual(value, 3)
    }
    
    func test2() {
        let value = solution.maxDistToClosest([0,1])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()

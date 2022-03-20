import Foundation

// 973. K Closest Points to Origin
// https://leetcode.com/problems/k-closest-points-to-origin/

class Solution {
    func kClosest(_ p: [[Int]], _ k: Int) -> [[Int]] {
        return Array(p.sorted { a,b in (a[0]*a[0] + a[1]*a[1]) < (b[0]*b[0] + b[1]*b[1])}[0..<k])
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The distance between (1, 3) and the origin is sqrt(10).
    // The distance between (-2, 2) and the origin is sqrt(8).
    // Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
    // We only want the closest k = 1 points from the origin, so the answer is just [[-2,2]].
    func test0() {
        let value = solution.kClosest([[1,3],[-2,2]], 1)
        XCTAssertEqual(value, [[-2,2]])
    }
    
    // The answer [[-2,4],[3,3]] would also be accepted.
    func test1() {
        let value = solution.kClosest([[3,3],[5,-1],[-2,4]], 2)
        XCTAssertEqual(value, [[3,3],[-2,4]])
    }
}

Tests.defaultTestSuite.run()

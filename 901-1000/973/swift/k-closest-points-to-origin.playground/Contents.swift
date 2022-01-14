import Foundation

// 973. K Closest Points to Origin
// https://leetcode.com/problems/k-closest-points-to-origin/

class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        let values = points.sorted() { helper($0, $1) }
        return Array(values[0..<K])
    }
    private func helper(_ a: [Int], _ b: [Int]) -> Bool {
        let pwInt: (Int) -> Int = { Int(pow(Double($0), 2)) }
        let mapA = a.map{pwInt($0)}.reduce(0, +)
        let mapB = b.map{pwInt($0)}.reduce(0, +)
        return mapA < mapB
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

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

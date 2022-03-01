import Foundation

// 1232. Check If It Is a Straight Line
// https://leetcode.com/problems/check-if-it-is-a-straight-line/

class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        let len = coordinates.count
        guard len > 2 else { return true }
        let prev = Double(coordinates[1][1] - coordinates[0][1])/Double(coordinates[1][0] - coordinates[0][0])
        for idx in 2..<len {
            let one = Double(coordinates[idx][1] - coordinates[idx-1][1])
            let zero = Double(coordinates[idx][0] - coordinates[idx-1][0])
            let curr = one / zero
            if abs(prev) == Double.infinity && abs(prev) == abs(curr) { continue }
            if prev != curr { return false }
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.checkStraightLine([[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]])
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.checkStraightLine([[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()

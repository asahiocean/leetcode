import Foundation

// 867. Transpose Matrix
// https://leetcode.com/problems/transpose-matrix/

class Solution {
    func transpose(_ m: [[Int]]) -> [[Int]] {
        return (0..<m[0].count).map { c in (0..<m.count).map { m[$0][c] } }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    func test0() {
        let value = solution.transpose([[1,2,3],[4,5,6],[7,8,9]])
        XCTAssertEqual(value, [[1,4,7],[2,5,8],[3,6,9]])
    }
    
    func test1() {
        let value = solution.transpose([[1,2,3],[4,5,6]])
        XCTAssertEqual(value, [[1,4],[2,5],[3,6]])
    }
}

Tests.defaultTestSuite.run()

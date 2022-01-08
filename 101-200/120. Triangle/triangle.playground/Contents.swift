import Foundation

// 120. Triangle
// https://leetcode.com/problems/triangle/

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let len = triangle.count
        guard len >= 1 && len <= 200 else { return 0 }
        var last = triangle.last!
        for i in stride(from: len - 2, through: 0, by: -1) {
            for j in 0...i { last[j] = min(last[j], last[j+1]) + triangle[i][j] }
        }
        return last[0]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.018 (0.020) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The triangle looks like:
    //    2
    //   3 4
    //  6 5 7
    // 4 1 8 3
    // The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).
    func test0() {
        let value = solution.minimumTotal([[2],
                                           [3,4],
                                           [6,5,7],
                                           [4,1,8,3]])
        XCTAssertEqual(value, 11)
    }
    
    func test1() {
        let value = solution.minimumTotal([[-10]])
        XCTAssertEqual(value, -10)
    }
}

Tests.defaultTestSuite.run()

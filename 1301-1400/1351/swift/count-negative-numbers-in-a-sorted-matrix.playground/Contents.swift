import Foundation

// 1351. Count Negative Numbers in a Sorted Matrix
// https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/

class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        var val = 0
        for r in grid {
            for i in r.reversed() where i < 0 {
                val += 1
            }
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // There are 8 negatives number in the matrix.
    func test0() {
        let value = solution.countNegatives([[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]])
        XCTAssertEqual(value, 8)
    }
    
    func test1() {
        let value = solution.countNegatives([[3,2],[1,0]])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

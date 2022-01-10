import Foundation

// 64. Minimum Path Sum
// https://leetcode.com/problems/minimum-path-sum/

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count, cols = grid[0].count
        for c in 1..<cols {
            grid[0][c] += grid[0][c-1]
        }
        for r in 1..<rows {
            grid[r][0] += grid[r-1][0]
            for c in 1..<cols {
                let min = min(grid[r-1][c], grid[r][c-1])
                grid[r][c] += min
            }
        }
        return grid[rows-1][cols-1]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.036 (0.038) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.
    func test0() {
        let value = solution.minPathSum([[1,3,1],[1,5,1],[4,2,1]])
        XCTAssertEqual(value, 7)
    }
    
    func test1() {
        let value = solution.minPathSum([[1,2,3],[4,5,6]])
        XCTAssertEqual(value, 12)
    }
}

Tests.defaultTestSuite.run()

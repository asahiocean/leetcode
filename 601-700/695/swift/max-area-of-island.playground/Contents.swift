import Foundation

// 695. Max Area of Island
// https://leetcode.com/problems/max-area-of-island/

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        
        var area = 0, grid = grid
        for (i, row) in grid.enumerated() {
            for j in 0..<row.count {
                let btrack = backtrack(&grid, row: i, col: j)
                area = max(btrack, area)
            }
        }
        return area
    }
    
    private func backtrack(_ grid: inout [[Int]], row: Int, col: Int) -> Int {
        if (row < 0 || col < 0) || (row == grid.count || col == grid[0].count) || (grid[row][col] != 1) { return 0 }
        grid[row][col] = 0
        var area = 1
        for (i, j) in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
            let rowNext = row + i, colNext = col + j
            area += backtrack(&grid, row: rowNext, col: colNext)
        }
        return area
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.032 (0.034) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The answer is not 11, because the island must be connected 4-directionally.
    func test0() {
        let value = solution.maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],
                                              [0,0,0,0,0,0,0,1,1,1,0,0,0],
                                              [0,1,1,0,1,0,0,0,0,0,0,0,0],
                                              [0,1,0,0,1,1,0,0,1,0,1,0,0],
                                              [0,1,0,0,1,1,0,0,1,1,1,0,0],
                                              [0,0,0,0,0,0,0,0,0,0,1,0,0],
                                              [0,0,0,0,0,0,0,1,1,1,0,0,0],
                                              [0,0,0,0,0,0,0,1,1,0,0,0,0]])
        XCTAssertEqual(value, 6)
    }
    
    func test1() {
        let value = solution.maxAreaOfIsland([[0,0,0,0,0,0,0,0]])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

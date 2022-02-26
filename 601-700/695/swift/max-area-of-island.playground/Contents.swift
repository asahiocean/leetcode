import Foundation

// 695. Max Area of Island
// https://leetcode.com/problems/max-area-of-island/

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var value = 0, grid = grid
        for (x, cols) in grid.enumerated() {
            for y in 0..<cols.count {
                value = max(backtrack(&grid, x, y), value)
            }
        }
        return value
    }
    private func backtrack(_ grid: inout [[Int]], _ x: Int, _ y: Int) -> Int {
        let rows = grid.count, cols = grid[0].count
        if (x < 0 || y < 0) || (x == rows || y == cols) || (grid[x][y] != 1) { return 0 }
        grid[x][y] = 0
        var value = 1
        for (a, b) in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
            value += backtrack(&grid, (x + a), (y + b))
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.022 (0.024) seconds

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

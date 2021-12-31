import Foundation

// 200. Number of Islands
// https://leetcode.com/problems/number-of-islands/

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        
        var value = 0, n = grid[0].count, m = grid.count
        
        guard m > 0 && n > 0 else { return 0 }
        
        var grid: [[Character]] = grid
        
        for i in 0..<m {
            for j in 0..<n where "\(grid[i][j])" == "1" {
                value += 1
                dfs(&grid, m, n, i, j)
            }
        }
        return value
    }
    
    private func dfs(_ grid: inout [[Character]], _ m: Int, _ n: Int, _ i: Int, _ t: Int) {
        guard i >= 0 && i < m && t >= 0 && t < n && "\(grid[i][t])" == "1" else { return }
        grid[i][t] = Character("0")
        dfs(&grid, m, n, i + 1, t)
        dfs(&grid, m, n, i - 1, t)
        dfs(&grid, m, n, i, t + 1)
        dfs(&grid, m, n, i, t - 1)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.019 (0.021) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.numIslands([["1","1","1","1","0"],
                                         ["1","1","0","1","0"],
                                         ["1","1","0","0","0"],
                                         ["0","0","0","0","0"]])
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.numIslands([["1","1","0","0","0"],
                                         ["1","1","0","0","0"],
                                         ["0","0","1","0","0"],
                                         ["0","0","0","1","1"]])
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()

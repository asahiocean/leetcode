import Foundation

// 200. Number of Islands
// https://leetcode.com/problems/number-of-islands/

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let rows = grid.count, cols = grid[0].count
        guard rows > 0 && cols > 0 else { return 0 }
        
        var count = 0, gridCopy = grid
        
        for a in 0..<rows {
            for b in 0..<cols where gridCopy[a][b] == "1" {
                dfs(&gridCopy, rows, cols, a, b)
                count += 1
            }
        }
        return count
    }
    private func dfs(_ grid: inout [[Character]], _ m: Int, _ n: Int, _ a: Int, _ b: Int) {
        guard a >= 0 && a < m && b >= 0 && b < n && grid[a][b] != "0" else { return }
        grid[a][b] = "0"
        for (a,b) in [(a+1, b), (a-1, b), (a, b+1), (a, b-1)] { dfs(&grid, m, n, a, b) }
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

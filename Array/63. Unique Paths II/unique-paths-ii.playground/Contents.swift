import Foundation

// 63. Unique Paths II
// https://leetcode.com/problems/unique-paths-ii/

class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let cols = obstacleGrid.count, rows = obstacleGrid[0].count
        guard cols > 0, rows > 0 else { return 0 }
        var dp = [[Int]](repeating: [Int](repeating: -1, count: rows), count: cols)
        return helper(cols - 1, rows - 1, &dp, obstacleGrid)
    }
    
    private func helper(_ m: Int, _ n: Int, _ dp: inout [[Int]], _ grid: [[Int]]) -> Int {
        if m < 0 || n < 0 || grid[m][n] == 1 { return 0 }
        if m == 0 && n == 0 { return 1 }
        if dp[m][n] != -1 { return dp[m][n] }
        dp[m][n] = helper(m - 1, n, &dp, grid) + helper(m, n - 1, &dp, grid)
        return dp[m][n]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // There is one obstacle in the middle of the 3x3 grid above.
    // There are two ways to reach the bottom-right corner:
    // 1. Right -> Right -> Down -> Down
    // 2. Down -> Down -> Right -> Right
    func test0() {
        let value = solution.uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]])
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.uniquePathsWithObstacles([[0,1],[0,0]])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()

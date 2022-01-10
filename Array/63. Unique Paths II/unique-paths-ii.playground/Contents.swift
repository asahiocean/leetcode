import Foundation

// 63. Unique Paths II
// https://leetcode.com/problems/unique-paths-ii/

class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count, n = obstacleGrid[0].count
        guard m > 0, n > 0 else { return 0 }
        var dp = Array(repeating: Array(repeating: -1, count: n), count: m)
        return helper(m - 1, n - 1, &dp, obstacleGrid)
    }
    
    private func helper(_ m: Int, _ n: Int, _ dp: inout [[Int]], _ grid: [[Int]]) -> Int {
        if m < 0 || n < 0 || grid[m][n] == 1 { return 0 }
        if m == 0 && n == 0 { return 1 }
        if dp[m][n] != -1 { return dp[m][n] }
        dp[m][n] = helper(m - 1, n, &dp, grid) + helper(m, n - 1, &dp, grid)
        return dp[m][n]
    }
}

// Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]])
        XCTAssertEqual(res, 2)
    }
    func test1() {
        let res = s.uniquePathsWithObstacles([[0,1],[0,0]])
        XCTAssertEqual(res, 1)
    }
}

Tests.defaultTestSuite.run()

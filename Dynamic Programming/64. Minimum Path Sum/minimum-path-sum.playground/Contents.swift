import Foundation

// 64. Minimum Path Sum
// https://leetcode.com/problems/minimum-path-sum/
// Discuss: https://leetcode.com/problems/minimum-path-sum/discuss/1369639/Swift%3A-Minimum-Path-Sum-(%2B-Test-Cases)

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var dp = grid
        let rs = grid.count, cs = grid[0].count
        (1..<cs).forEach {
            dp[0][$0] += dp[0][$0-1]
        }
        (1..<rs).forEach {
            dp[$0][0] += dp[$0-1][0]
            for i in 1..<cs {
                dp[$0][i] += min(dp[$0-1][i], dp[$0][i-1])
            }
        }
        return dp[rs-1][cs-1]
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.036 (0.038) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.minPathSum([[1,3,1],[1,5,1],[4,2,1]])
        XCTAssertEqual(res, 7)
    }
    func test1() {
        let res = s.minPathSum([[1,2,3],[4,5,6]])
        XCTAssertEqual(res, 12)
    }
}

Tests.defaultTestSuite.run()

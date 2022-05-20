import Foundation

// 63. Unique Paths II
// https://leetcode.com/problems/unique-paths-ii/

class Solution {
    func uniquePathsWithObstacles(_ og: [[Int]]) -> Int {
        guard !og.isEmpty else { return 0 }
        var dp = [[Int]](repeating: [Int](repeating: -1, count: og[0].count), count: og.count)
        func calc(_ r: Int, _ c: Int) -> Int {
            if r < 0 || c < 0 || og[r][c] == 1 { return 0 }
            if r == 0 && c == 0 { return 1 }
            if dp[r][c] != -1 { return dp[r][c] }
            dp[r][c] = calc(r - 1, c) + calc(r, c - 1)
            return dp[r][c]
        }
        return calc(og.count - 1, og[0].count - 1)
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

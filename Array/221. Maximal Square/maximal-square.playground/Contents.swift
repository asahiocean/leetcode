import Foundation

// https://leetcode.com/problems/maximal-square/
// Discuss: https://vk.cc/c3PDpg

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty else { return 0 }
        var length = 0
        let row = matrix.count, col = matrix[0].count
        var dp = Array<[Int]>(repeating: [Int](repeating: 0, count: col+1), count: row+1)
        for x in 1...row {
            for y in 1...col where matrix[x-1][y-1] == "1" {
                dp[x][y] = min(dp[x-1][y], dp[x][y-1], dp[x-1][y-1]) + 1
                length = max(dp[x][y], length)
            }
        }
        return length * length
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.111 (0.113) seconds

class Tests: XCTestCase {
    let s = Solution()
    func test0() {
        let res = s.maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]])
        XCTAssertEqual(res, 4)
    }
    func test1() {
        let res = s.maximalSquare([["0","1"],["1","0"]])
        XCTAssertEqual(res, 1)
    }
    func test2() {
        let res = s.maximalSquare([["0"]])
        XCTAssertEqual(res, 0)
    }
}

Tests.defaultTestSuite.run()

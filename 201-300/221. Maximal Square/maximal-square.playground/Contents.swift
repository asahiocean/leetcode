import Foundation

// 221. Maximal Square
// https://leetcode.com/problems/maximal-square/

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty else { return 0 }
        var length = 0
        let row = matrix.count, col = matrix[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: col+1), count: row+1)
        for x in 1...row {
            for y in 1...col where matrix[x-1][y-1] == "1" {
                dp[x][y] = min(dp[x-1][y], dp[x][y-1], dp[x-1][y-1]) + 1
                length = max(dp[x][y], length)
            }
        }
        return length * length
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.111 (0.113) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.maximalSquare([["1","0","1","0","0"],
                                            ["1","0","1","1","1"],
                                            ["1","1","1","1","1"],
                                            ["1","0","0","1","0"]])
        XCTAssertEqual(value, 4)
    }
    func test1() {
        let value = solution.maximalSquare([["0","1"],["1","0"]])
        XCTAssertEqual(value, 1)
    }
    func test2() {
        let value = solution.maximalSquare([["0"]])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

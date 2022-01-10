import Foundation

// 221. Maximal Square
// https://leetcode.com/problems/maximal-square/

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let rows = matrix.count, cols = matrix[0].count
        guard rows > 0 else { return 0 }
        var len = 0
        var grid = [[Int]](repeating: [Int](repeating: 0, count: cols+1), count: rows+1)
        for r in 1...rows {
            for c in 1...cols where matrix[r-1][c-1] == "1" {
                grid[r][c] = min(grid[r-1][c], grid[r][c-1], grid[r-1][c-1]) + 1
                len = max(grid[r][c], len)
            }
        }
        return (len * len)
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

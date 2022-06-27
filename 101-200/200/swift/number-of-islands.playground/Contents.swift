import Foundation

// 200. Number of Islands
// https://leetcode.com/problems/number-of-islands/

class Solution {
    func numIslands(_ g: [[Character]]) -> Int {
        guard !g.isEmpty else { return 0 }
        let rows = g.count, cols = g[0].count
        var val = 0, grid = g

        func dfs(_ m: Int, _ n: Int, _ a: Int, _ b: Int) {
            guard a >= 0 && a < m && b >= 0 && b < n && grid[a][b] != "0" else { return }
            grid[a][b] = "0"
            for (a,b) in [(a+1, b), (a-1, b), (a, b+1), (a, b-1)] { dfs(m, n, a, b) }
        }
        
        for a in 0..<rows {
            for b in 0..<cols where grid[a][b] == "1" {
                dfs(rows, cols, a, b)
                val += 1
            }
        }
        return val
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

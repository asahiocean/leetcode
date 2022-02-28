import Foundation

// 417. Pacific Atlantic Water Flow
// https://leetcode.com/problems/pacific-atlantic-water-flow/

class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let row = heights.count, col = heights[0].count
        var result: [[Int]] = []
        
        var pacific = ocean(r: row, c: col)
        var atlantic = ocean(r: row, c: col)
        
        func dfs(_ x: Int, _ y: Int, _ prev: Int, _ s: inout [[Bool]]) {
            if x < 0 || y < 0 || x == row || y == col { return }
            if (prev > heights[x][y]) { return }
            if (s[x][y] == true) { return }
            s[x][y] = true
            
            typealias XY = (x: Int, y: Int)
            for n: XY in [(1,0),(-1,0),(0,1),(0,-1)] {
                dfs(x + n.x, y + n.y, heights[x][y], &s)
            }
        }
        
        for i in 0..<row {
            dfs(i,0,heights[i][0],&pacific)
            dfs(i,col-1,heights[i][col-1],&atlantic)
        }
        for j in 0..<col {
            dfs(0,j,heights[0][j],&pacific)
            dfs(row-1,j,heights[row-1][j],&atlantic)
        }
        for i in 0..<row {
            for j in 0..<col where pacific[i][j] && atlantic[i][j] {
                result.append([i,j])
            }
        }
        return result
    }
    private func ocean(r row: Int, c col: Int) -> [[Bool]] {
        return Array(repeating: Array(repeating: false, count: col), count: row)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.044 (0.046) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.pacificAtlantic([[1,2,2,3,5],
                                              [3,2,3,4,4],
                                              [2,4,5,3,1],
                                              [6,7,1,4,5],
                                              [5,1,1,2,4]])
        XCTAssertEqual(value, [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]])
    }
    
    func test1() {
        let value = solution.pacificAtlantic([[2,1],[1,2]])
        XCTAssertEqual(value, [[0,0],[0,1],[1,0],[1,1]])
    }
}

Tests.defaultTestSuite.run()

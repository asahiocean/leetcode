import Foundation

// 1020. Number of Enclaves
// https://leetcode.com/problems/number-of-enclaves/

class Solution {
    func numEnclaves(_ grid: [[Int]]) -> Int {
        let row = grid.count, col = grid[0].count
        if row == 1 || col == 1 { return 0 }
        
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)
        var result = 0
        
        typealias Position = (x: Int, y: Int)
        let valid: (Position) -> Bool = {
            let x = $0.x, y = $0.y
            return (x >= 0 && x < row) && (y >= 0 && y < col) && (grid[x][y] == 1 && !visited[x][y])
        }
        
        func dfs(_ px: Int, _ py: Int)  {
            for (x,y) in [(0,1),(0,-1),(1,0),(-1,0)] {
                let new = (x: (px + x), y: (py + y))
                if valid(new) {
                    visited[new.x][new.y] = true
                    dfs(new.x, new.y)
                }
            }
        }
        
        for y in 0..<col {
            if grid[0][y] == 1 && !visited[0][y] {
                visited[0][y] = true
                dfs(0, y)
            }
            if grid[row-1][y] == 1 && !visited[row-1][y] {
                visited[row-1][y] = true
                dfs(row - 1, y)
            }
        }
        for x in 0..<row {
            if grid[x][0] == 1 && !visited[x][0] {
                visited[x][0] = true
                dfs(x, 0)
            }
            if grid[x][col-1] == 1 && !visited[x][col-1] {
                visited[x][col-1] = true
                dfs(x, col - 1)
            }
        }
        for x in 0..<row {
            for y in 0..<col where grid[x][y] == 1 && !visited[x][y] {
                result += 1
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.020 (0.022) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // There are three 1s that are enclosed by 0s, and one 1 that is not enclosed because its on the boundary.
    func test0() {
        let value = solution.numEnclaves([[0,0,0,0],
                                          [1,0,1,0],
                                          [0,1,1,0],
                                          [0,0,0,0]])
        XCTAssertEqual(value, 3)
    }
    
    // All 1s are either on the boundary or can reach the boundary.
    func test1() {
        let value = solution.numEnclaves([[0,1,1,0],
                                          [0,0,1,0],
                                          [0,0,1,0],
                                          [0,0,0,0]])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

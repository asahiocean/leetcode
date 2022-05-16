import Foundation

// 1091. Shortest Path in Binary Matrix
// https://leetcode.com/problems/shortest-path-in-binary-matrix/

class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        guard grid[0][0] == 0 else { return -1 }
        let row = grid.count, col = grid[0].count
        guard grid[row - 1][col - 1] == 0 else { return -1 }
        var grid = grid, queue = [(x: 0, y: 0)]
        grid[0][0] = 1
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            if cur.x == row - 1, cur.y == col - 1 { return grid[cur.x][cur.y] }
            for (dx,dy) in [(0,1),(0,-1),(1,0),(-1,0),(-1,-1),(-1,1),(1,-1),(1,1)] {
                let new = (x: (cur.x + dx), y: (cur.y + dy))
                guard new.x >= 0, new.y >= 0, new.x < row, new.y < col, grid[new.x][new.y] == 0 else { continue }
                queue.append((new.x, new.y))
                grid[new.x][new.y] = grid[cur.x][cur.y] + 1
            }
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.shortestPathBinaryMatrix([[0,1],[1,0]])
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.shortestPathBinaryMatrix([[0,0,0],[1,1,0],[1,1,0]])
        XCTAssertEqual(value, 4)
    }
    
    func test2() {
        let value = solution.shortestPathBinaryMatrix([[1,0,0],[1,1,0],[1,1,0]])
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()

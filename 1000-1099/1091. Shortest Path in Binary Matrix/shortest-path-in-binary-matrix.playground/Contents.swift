import Foundation

// 1091. Shortest Path in Binary Matrix
// https://leetcode.com/problems/shortest-path-in-binary-matrix/

class Solution {
    private typealias Coords = (x: Int, y: Int)
    private let directions: [Coords] = [(0,1),(0,-1),(1,0),(-1,0),(-1,-1),(-1,1),(1,-1),(1,1)]
    
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        var grid = grid
        
        let count = grid.count
        let length = grid[0].count
        
        guard grid[0][0] == 0, grid[count-1][length-1] == 0 else { return -1 }
        
        var queue: [Coords] = []
        grid[0][0] = 1
        queue.append((0, 0))
        
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            
            guard x != count - 1 || y != length - 1 else { return grid[x][y] }
            
            for d in directions {
                let newX = x + d.x
                let newY = y + d.y
                guard valid(newX, newY, count, length, grid) else { continue }
                queue.append((newX, newY))
                grid[newX][newY] = grid[x][y] + 1
            }
        }
        return -1
    }
    
    private func valid(_ x: Int, _ y: Int, _ n: Int, _ m: Int, _ grid: [[Int]]) -> Bool {
        return (x >= 0 && y >= 0) && (x < n && y < m) && (grid[x][y] == 0)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.shortestPathBinaryMatrix([[0,0,0],[1,1,0],[1,1,0]])
        XCTAssertEqual(value, 4)
    }
    
    func test1() {
        let value = solution.shortestPathBinaryMatrix([[1,0,0],[1,1,0],[1,1,0]])
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 1162. As Far from Land as Possible
// https://leetcode.com/problems/as-far-from-land-as-possible/

class Solution {
    func maxDistance(_ grid: [[Int]]) -> Int {
        typealias Position = (x: Int, y: Int)
        var grid = grid, dist = 0
        var lands: [Position] = []
        
        for (x,row) in grid.enumerated() {
            for (y, col) in row.enumerated() {
                if col == 1 {
                    grid[x][y] = 0
                    lands.append((x,y))
                } else {
                    grid[x][y] = -1
                }
            }
        }
        
        while !lands.isEmpty {
            let curr = lands.removeFirst()
            for step in [(0,-1),(0,1),(-1,0),(1,0)] as [Position] {
                let row = curr.x + step.x, col = curr.y + step.y
                guard (row >= 0 && row < grid.count) else { continue }
                guard (col >= 0 && col < grid[0].count) else { continue }
                if grid[row][col] == -1 {
                    let newPos = grid[curr.x][curr.y] + 1
                    grid[row][col] = newPos
                    dist = max(newPos, dist)
                    lands.append((row,col))
                }
            }
        }
        return (dist == 0) ? -1 : dist
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.030 (0.032) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The cell (1, 1) is as far as possible from all the land with distance 2.
    func test0() {
        let value = solution.maxDistance([[1,0,1],[0,0,0],[1,0,1]])
        XCTAssertEqual(value, 2)
    }
    
    // The cell (2, 2) is as far as possible from all the land with distance 4.
    func test1() {
        let value = solution.maxDistance([[1,0,0],[0,0,0],[0,0,0]])
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()

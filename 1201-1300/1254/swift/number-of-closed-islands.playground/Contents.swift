import Foundation

// 1254. Number of Closed Islands
// https://leetcode.com/problems/number-of-closed-islands/

class Solution {
    private var islands: [[Int]] = []
    func closedIsland(_ grid: [[Int]]) -> Int {
        islands = grid
        var result = 0
        let rows = grid.count, cols = grid[0].count
        for x in 0..<rows {
            for y in 0..<cols where islands[x][y] == 0 && dfs(x, y, (rows, cols)) {
                islands[x][y] = 9
                result += 1
            }
        }
        return result
    }
    
    private func dfs(_ x: Int, _ y: Int, _ d: (x: Int, y: Int)) -> Bool {
        if x < 0 || x >= d.x || y < 0 || y >= d.y { return false }
        if [1,2,9].contains(islands[x][y]) { return true }
        islands[x][y] = 2 // visited
        var isClosed = true
        for (a,b) in [(0,1),(0,-1),(1,0),(-1,0)] {
            isClosed = dfs(x+a, y+b, (d.x, d.y)) && isClosed
        }
        return isClosed
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.034 (0.036) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Islands in gray are closed because they are completely surrounded by water (group of 1s).
    func test0() {
        let value = solution.closedIsland([[1,1,1,1,1,1,1,0],
                                           [1,0,0,0,0,1,1,0],
                                           [1,0,1,0,1,1,1,0],
                                           [1,0,0,0,0,1,0,1],
                                           [1,1,1,1,1,1,1,0]])
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.closedIsland([[0,0,1,0,0],[0,1,0,1,0],[0,1,1,1,0]])
        XCTAssertEqual(value, 1)
    }
    
    func test2() {
        let value = solution.closedIsland([[1,1,1,1,1,1,1],
                                           [1,0,0,0,0,0,1],
                                           [1,0,1,1,1,0,1],
                                           [1,0,1,0,1,0,1],
                                           [1,0,1,1,1,0,1],
                                           [1,0,0,0,0,0,1],
                                           [1,1,1,1,1,1,1]])
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()

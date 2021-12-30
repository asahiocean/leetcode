import Foundation

// 1162. As Far from Land as Possible
// https://leetcode.com/problems/as-far-from-land-as-possible/

class Solution {
    func maxDistance(_ grid: [[Int]]) -> Int {
        var grid = grid, dist = 0
        var lands: [(x: Int, y: Int)] = []
        for (i,r) in grid.enumerated() {
            for (y, item) in r.enumerated() {
                if item == 1 {
                    grid[i][y] = 0
                    lands.append((i,y))
                } else {
                    grid[i][y] = -1
                }
            }
        }
        
        let rowCount = grid.count, colCount = grid[0].count
        while !lands.isEmpty {
            let point: (x: Int, y: Int) = lands.removeFirst()
            for item: (x: Int, y: Int) in [(0,-1),(0,1),(-1,0),(1,0)] {
                let x = point.x + item.x, y = point.y + item.y
                if x >= 0 && x < rowCount && y >= 0 && y < colCount && grid[x][y] == -1 {
                    let distance: Int = grid[point.x][point.y] + 1
                    grid[x][y] = distance
                    dist = max(distance,dist)
                    lands.append((x,y))
                }
            }
        }
        return (dist == 0) ? -1 : dist
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.255 (0.257) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.maxDistance([[1,0,1],[0,0,0],[1,0,1]])
        XCTAssertEqual(value, 2)
    }
    func test1() {
        let value = solution.maxDistance([[1,0,0],[0,0,0],[0,0,0]])
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()

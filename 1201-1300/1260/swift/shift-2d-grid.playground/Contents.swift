import Foundation

// 1260. Shift 2D Grid
// https://leetcode.com/problems/shift-2d-grid/

class Solution {
    func shiftGrid(_ g: [[Int]], _ k: Int) -> [[Int]] {
        if k == 0 { return g }
        let row = g.count, col = g[0].count
        var grid = g
        for r in 0..<row {
            for c in 0..<col {
                let rw1 = (r + (c + k) / col) % row
                let cl1 = (c + k) % col
                grid[rw1][cl1] = g[r][c]
            }
        }
        return grid
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    func test0() {
        let value = solution.shiftGrid([[1,2,3],[4,5,6],[7,8,9]], 1)
        XCTAssertEqual(value, [[9,1,2],[3,4,5],[6,7,8]])
    }
    
    func test1() {
        let value = solution.shiftGrid([[3,8,1,9],[19,7,2,5],[4,6,11,10],[12,0,21,13]], 4)
        XCTAssertEqual(value, [[12,0,21,13],[3,8,1,9],[19,7,2,5],[4,6,11,10]])
    }
    
    func test2() {
        let value = solution.shiftGrid([[1,2,3],[4,5,6],[7,8,9]], 9)
        XCTAssertEqual(value, [[1,2,3],[4,5,6],[7,8,9]])
    }
}

Tests.defaultTestSuite.run()

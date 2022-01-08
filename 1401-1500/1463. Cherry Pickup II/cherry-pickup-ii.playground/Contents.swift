import Foundation

// 1463. Cherry Pickup II
// https://leetcode.com/problems/cherry-pickup-ii/

class Solution {
    func cherryPickup(_ grid: [[Int]]) -> Int {
        let cols = grid.count, rows = grid[0].count
        var fields = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: rows), count: rows), count: cols)
        return dp(grid, 0, 0, rows - 1, rows, cols, &fields)
    }
    
    private func dp(_ grid: [[Int]], _ row: Int, _ col1: Int, _ col2: Int, _ rows: Int, _ cols: Int, _ fields: inout [[[Int]]]) -> Int {
        guard col1 >= 0, col1 < rows, col2 >= 0, col2 < rows else { return 0 }
        
        let cell = fields[row][col1][col2]
        
        guard cell == -1 else { return cell }
        
        var value = grid[row][col1]
        
        if col1 != col2 { value += grid[row][col2] }
        
        if row != cols-1 {
            var current = 0
            for nc1 in (col1 - 1)...(col1 + 1) {
                for nc2 in (col2 - 1)...(col2 + 1) {
                    current = max(current, dp(grid, row + 1, nc1, nc2, rows, cols, &fields))
                }
            }
            value += current
        }
        fields[row][col1][col2] = value
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.031 (0.033) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// Path of robot #1 and #2 are described in color green and blue respectively.
    /// Cherries taken by Robot #1, (3 + 2 + 5 + 2) = 12.
    /// Cherries taken by Robot #2, (1 + 5 + 5 + 1) = 12.
    /// Total of cherries: 12 + 12 = 24.
    func test0() {
        let value = solution.cherryPickup([[3,1,1],
                                           [2,5,1],
                                           [1,5,5],
                                           [2,1,1]])
        XCTAssertEqual(value, 24)
    }
    
    /// Path of robot #1 and #2 are described in color green and blue respectively.
    /// Cherries taken by Robot #1, (1 + 9 + 5 + 2) = 17.
    /// Cherries taken by Robot #2, (1 + 3 + 4 + 3) = 11.
    /// Total of cherries: 17 + 11 = 28.
    func test1() {
        let value = solution.cherryPickup([[1,0,0,0,0,0,1],
                                           [2,0,0,0,0,3,0],
                                           [2,0,9,0,0,0,0],
                                           [0,3,0,5,4,0,0],
                                           [1,0,2,3,0,0,6]])
        XCTAssertEqual(value, 28)
    }
}

Tests.defaultTestSuite.run()

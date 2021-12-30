import Foundation

// 695. Max Area of Island
// https://leetcode.com/problems/max-area-of-island/

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var maxArea = 0
        var tempGrid = grid
        for (i, row) in tempGrid.enumerated() {
            for j in 0..<row.count {
                maxArea = max(backtrack(&tempGrid, row: i, col: j), maxArea)
            }
        }
        return maxArea
    }
    
    private func backtrack(_ grid: inout [[Int]], row: Int, col: Int) -> Int {
        if (row < 0 || col < 0) || (row == grid.count || col == grid[0].count) || (grid[row][col] != 1) { return 0 }
        grid[row][col] = 0
        var area = 1
        for (i, j) in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
            let rowNext = row + i
            let colNext = col + j
            area += backtrack(&grid, row: rowNext, col: colNext)
        }
        return area
    }
}

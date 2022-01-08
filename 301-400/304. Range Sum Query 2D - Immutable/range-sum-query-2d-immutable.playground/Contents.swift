import Foundation

// 304. Range Sum Query 2D - Immutable
// https://leetcode.com/problems/range-sum-query-2d-immutable/

class NumMatrix {
    
    private var sum: [[Int]]
    
    init(_ matrix: [[Int]]) {
        let cols = matrix.count, rows = matrix[0].count
        sum = [[Int]](repeating: [Int](repeating: 0, count: rows), count: cols)
        
        for c in 0..<cols {
            var sumL = 0
            for r in 0..<rows {
                sumL += matrix[c][r]
                sum[c][r] = sumL + (c != 0 ? sum[c - 1][r] : 0)
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        // When using if-else construction the status is shown "Time Limit Exceeded"
        let r2c2 = sum[row2][col2]
        switch true {
        case row1 == 0 && col1 == 0:
            return r2c2
        case row1 == 0:
            return r2c2 - sum[row2][col1 - 1]
        case col1 == 0:
            return r2c2 - sum[row1 - 1][col2]
        default:
            return r2c2 - sum[row2][col1 - 1] - sum[row1-1][col2] + sum[row1-1][col1-1]
        }
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */

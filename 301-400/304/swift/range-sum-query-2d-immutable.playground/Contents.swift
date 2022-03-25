import Foundation

// 304. Range Sum Query 2D - Immutable
// https://leetcode.com/problems/range-sum-query-2d-immutable/

class NumMatrix {
    
    private(set) var mat: [[Int]]
    
    init(_ matrix: [[Int]]) {
        self.mat = matrix
        for c in 0..<matrix.count {
            var sumL = 0
            for r in 0..<matrix[0].count {
                sumL += matrix[c][r]
                mat[c][r] = sumL + (c != 0 ? mat[c - 1][r] : 0)
            }
        }
    }
    
    func sumRegion(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) -> Int {
        // When using if-else construction the status is shown "Time Limit Exceeded"
        let r2c2 = mat[r2][c2]
        switch true {
        case r1 == 0 && c1 == 0:
            return r2c2
        case r1 == 0:
            return r2c2 - mat[r2][c1 - 1]
        case c1 == 0:
            return r2c2 - mat[r1 - 1][c2]
        default:
            return r2c2 - mat[r2][c1 - 1] - mat[r1-1][c2] + mat[r1-1][c1-1]
        }
    }
}

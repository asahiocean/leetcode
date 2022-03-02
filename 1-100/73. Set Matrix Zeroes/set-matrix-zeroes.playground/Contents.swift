import Foundation

// 73. Set Matrix Zeroes
// https://leetcode.com/problems/set-matrix-zeroes/

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var mat = matrix, arrX: [Int] = [], arrY: [Int] = []
        let rows = mat.count, cols = mat[0].count
        
        for x in 0..<rows {
            for y in 0..<cols where mat[x][y] == 0 {
                arrX.append(x)
                arrY.append(y)
            }
        }
        for x in arrX {
            for y in 0..<cols { mat[x][y] = 0 }
        }
        for y in arrY {
            for x in 0..<rows { mat[x][y] = 0 }
        }
        matrix = mat
    }
}

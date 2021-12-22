import Foundation

// 73. Set Matrix Zeroes
// https://leetcode.com/problems/set-matrix-zeroes/

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var setX: Set<Int> = [], setY: Set<Int> = []
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] == 0 {
                    setX.insert(i)
                    setY.insert(j)
                }
            }
        }
        setX.forEach({
            for col in 0..<matrix[0].count { matrix[$0][col] = 0 }
        })
        setY.forEach({
            for row in 0..<matrix.count { matrix[row][$0] = 0 }
        })
    }
}

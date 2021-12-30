import Foundation

// 85. Maximal Rectangle
// https://leetcode.com/problems/maximal-rectangle/

class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        guard matrix.count != 0 else { return 0 }
        let cc = matrix[0].count
        guard cc != 0 else { return 0 } // col count
        var maxCount = 0
        for row in 0..<matrix.count {
            for col in 0..<cc where matrix[row][col].wholeNumberValue == 1 {
                maxCount = max(maxCount, mrp(matrix,cc,row,col))
            }
        }
        
        return maxCount
    }
    // maximal rectangle point
    private func mrp(_ matrix: [[Character]],_ cc: Int, _ row: Int , _ col: Int) -> Int {
        var mc = 1, // max count
            m = row,
            maxN = cc // count
        for i in row..<matrix.count {
            m = i
            for j in col..<cc where j < maxN && matrix[i][j].wholeNumberValue == 0 {
                maxN = j
                break
            }
            let tc = (m - row + 1) * (maxN - col) // tmp count
            mc = max(tc, mc)
        }
        return mc
    }
}

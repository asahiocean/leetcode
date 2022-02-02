import Foundation

// 54. Spiral Matrix
// https://leetcode.com/problems/spiral-matrix/

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard !(matrix.isEmpty) else { return [] }
        
        var result = [Int]()
        var rBegin = 0, rEnd = matrix.count - 1
        var cBegin = 0, cEnd = matrix[0].count - 1
        
        while rBegin <= rEnd && cBegin <= cEnd {
            // MARK: Traverse right
            for i in stride(from: cBegin, to: cEnd + 1, by: 1) {
                result.append(matrix[rBegin][i])
            }
            rBegin += 1
            
            // MARK: Traverse down
            for i in stride(from: rBegin, to: rEnd + 1, by: 1) {
                result.append(matrix[i][cEnd])
            }
            cEnd -= 1
            
            // MARK: Traverse left
            if rBegin <= rEnd {
                for i in stride(from: cEnd, to: cBegin - 1, by: -1) {
                    result.append(matrix[rEnd][i])
                }
            }
            rEnd -= 1
            
            // MARK: Traverse up
            if cBegin <= cEnd {
                for i in stride(from: rEnd, to: rBegin - 1, by: -1) {
                    result.append(matrix[i][cBegin])
                }
            }
            cBegin += 1
        }
        return result
    }
}

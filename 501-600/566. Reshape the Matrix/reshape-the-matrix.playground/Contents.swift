import Foundation

// 566. Reshape the Matrix
// https://leetcode.com/problems/reshape-the-matrix/

class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        
        guard !mat.isEmpty && mat.count * mat[0].count == r * c && r != mat.count else { return mat }
        
        var result = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
        
        var a = 0, b = 0
        
        for row in mat {
            for el in row {
                if b == c {
                    a += 1
                    b = 0
                }
                result[a][b] = el
                b += 1
            }
        }
        return result
    }
}


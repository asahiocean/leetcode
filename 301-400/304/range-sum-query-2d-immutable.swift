import Foundation

// 304. Range Sum Query 2D - Immutable
// https://leetcode.com/problems/range-sum-query-2d-immutable/

class NumMatrix {

    private var mat: [[Int]]
    
    init(_ m: [[Int]]) {
        mat = Array(repeating: Array(repeating: 0, count: m[0].count+1), count: m.count+1)
        for (r,rv) in m.enumerated() {
            var sum = 0
            for (c,cv) in rv.enumerated() {
                sum += cv
                mat[r+1][c+1] = mat[r][c+1] + sum
            }
        }
    }
    
    func sumRegion(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) -> Int {
        return mat[r2+1][c2+1] - mat[r2+1][c1] - mat[r1][c2+1] + mat[r1][c1]
    }
}

import Foundation

// 59. Spiral Matrix II
// https://leetcode.com/problems/spiral-matrix-ii/

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        let map = [Int](repeating: -1, count: n)
        var result = Array<[Int]>(repeating: map, count: n)
        let maxEl = (n * n)
        var top  = 0, bottom = n - 1, l = 0, r = (n - 1)
        var n = 1
        while n <= maxEl {
            if l <= r && n <= maxEl { // left -> right
                for i in l...r {
                    result[top][i] = n
                    n += 1
                }
                top += 1
            }
            if top <= bottom && n <= maxEl { // top -> bottom
                (top...bottom).forEach {
                    result[$0][r] =  n
                    n += 1
                }
                r  -= 1
            }
            if l <= r && n <= maxEl { // right -> left
                for i in (l...r).reversed() {
                    result[bottom][i] = n
                    n +=  1
                }
                bottom -= 1
            }
            if top <= bottom && n <= maxEl { // bottom -> top
                for i in (top...bottom).reversed() {
                    result[i][l] = n
                    n += 1
                }
                l += 1
            }
        }
        return result
        
    }
}

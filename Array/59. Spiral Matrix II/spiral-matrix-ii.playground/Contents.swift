import Foundation

// 59. Spiral Matrix II
// https://leetcode.com/problems/spiral-matrix-ii/

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        let map = [Int](repeating: -1, count: n)
        var result = [[Int]](repeating: map, count: n)
        let maxEl = (n * n)
        var top  = 0, bottom = n - 1, left = 0, right = (n - 1)
        var n = 1
        while n <= maxEl {
            if left <= right && n <= maxEl { // left -> right
                for i in left...right {
                    result[top][i] = n
                    n += 1
                }
                top += 1
            }
            if top <= bottom && n <= maxEl { // top -> bottom
                for i in top...bottom {
                    result[i][right] =  n
                    n += 1
                }
                right -= 1
            }
            if left <= right && n <= maxEl { // right -> left
                for i in (left...right).reversed() {
                    result[bottom][i] = n
                    n +=  1
                }
                bottom -= 1
            }
            if top <= bottom && n <= maxEl { // bottom -> top
                for i in (top...bottom).reversed() {
                    result[i][left] = n
                    n += 1
                }
                left += 1
            }
        }
        return result
    }
}

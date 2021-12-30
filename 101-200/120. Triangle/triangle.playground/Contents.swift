import Foundation

// 120. Triangle
// https://leetcode.com/problems/triangle/

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let length = triangle.count
        guard length >= 1 && length <= 200 else { return 0 }
        var last = triangle.last!
        for i in stride(from: triangle.count - 2, through: 0, by: -1) {
            for j in 0...i { last[j] = min(last[j], last[j+1]) + triangle[i][j] }
        }
        return last[0]
    }
}

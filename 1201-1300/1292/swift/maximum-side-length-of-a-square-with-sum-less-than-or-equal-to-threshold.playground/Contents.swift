import Foundation

// 1292. Maximum Side Length of a Square with Sum Less than or Equal to Threshold
// https://leetcode.com/problems/maximum-side-length-of-a-square-with-sum-less-than-or-equal-to-threshold/

class Solution {
    func maxSideLength(_ m: [[Int]], _ t: Int) -> Int {
        let row = m.count, col = m[0].count
        var cps = Array(repeating: [Int](repeating: 0, count: col + 1), count: row + 1)
        var mps = cps, res = 0
        for r in 0..<row {
            for c in 0..<col { cps[r+1][c+1] = cps[r][c+1] + m[r][c] }
        }
        for r in 0..<row {
            for c in 0..<col { mps[r+1][c+1] = mps[r+1][c] + cps[r+1][c+1] }
        }
        
        func valid(x: Int, y: Int, ln: Int) -> Bool {
            let pre = (x: x + ln, y: y + ln)
            return mps[pre.x][pre.y] - mps[x][pre.y] - mps[pre.x][y] + mps[x][y] <= t
        }
        
        for r in 0..<row {
            for c in 0..<col {
                let sqln = min(row - r, col - c)
                if sqln > res {
                    for l in (res + 1)...sqln where valid(x: r, y: c, ln: l) {
                        res = l
                    }
                }
            }
        }
        return res
    }
}

import Foundation

// 474. Ones and Zeroes
// https://leetcode.com/problems/ones-and-zeroes/

class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: [Int](repeating: 0, count: n + 1), count: m + 1)

        for s in strs {
            var zeros = 0, ones = 0
            for c in s { c == "1" ? (ones += 1) : (zeros += 1) }
            for a in stride(from: m, through: zeros, by: -1) {
                for b in stride(from: n, through: ones, by: -1) {
                    dp[a][b] = max(dp[a][b], dp[a - zeros][b - ones] + 1)
                }
            }
        }
        return dp[m][n]
    }
}

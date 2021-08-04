import Foundation

// 97. Interleaving String
// https://leetcode.com/problems/interleaving-string/

class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let m = s1.count, n = s2.count
        guard m + n == s3.count else { return false }
        let s1ch = Array(s1), s2ch = Array(s2), s3ch = Array(s3)
        var dp = Array<[Bool]>(repeating: Array<Bool>(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        for i in 0...m {
            for j in 0...n {
                let p = i + j - 1
                if i > 0 {
                    dp[i][j] =  dp[i][j] || dp[i - 1] [j] && s1ch[i - 1] == s3ch[p]
                }
                if j > 0 {
                    dp[i][j] =  dp[i][j] || dp[i] [j - 1] && s2ch[j - 1] == s3ch[p]
                }
            }
        }
        return dp[m][n]
    }
}

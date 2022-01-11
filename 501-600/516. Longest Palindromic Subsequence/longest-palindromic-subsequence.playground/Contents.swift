import Foundation

// 516. Longest Palindromic Subsequence
// https://leetcode.com/problems/longest-palindromic-subsequence/

class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        
        let size = s.count, array = [Character](s)
        var dp = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)
        var n = size - 1
        
        while n >= 0 {
            dp[n][n] = 1
            for k in (n + 1)..<size {
                if array[n] == array[k] {
                    dp[n][k] = dp[n + 1][k - 1] + 2
                } else {
                    dp[n][k] = max(dp[n + 1][k], dp[n][k - 1])
                }
            }
            n -= 1
        }
        return dp[0][size - 1]
    }
}

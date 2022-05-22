import Foundation

// 647. Palindromic Substrings
// https://leetcode.com/problems/palindromic-substrings/

class Solution {
    func countSubstrings(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        let len = s.count, chars = Array(s)
        var dp = Array(repeating: [Bool](repeating: false, count: len), count: len)
        var res = 0
        
        for i in 0..<len {
            dp[i][i] = true
            res += 1
        }
        for i in 0..<(len - 1) where chars[i] == chars[i + 1] {
            dp[i][i + 1] = true
            res += 1
        }
        guard len > 2 else { return res }
        for a in 3...len {
            for b in 0..<(len - a + 1) {
                let val = a + b - 1
                if dp[b + 1][val - 1] && chars[b] == chars[val] {
                    dp[b][val] = true
                    res += 1
                }
            }
        }
        return res
    }
}

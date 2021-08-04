import Foundation

// 91. Decode Ways
// https://leetcode.com/problems/decode-ways/

class Solution {
    func numDecodings(_ s: String) -> Int {
        let s = Array(s)
        var dp = Array(repeating: 0, count: s.count + 1)
        dp[0] = 1
        func isValid(_ chars: [Character], _ s: Int, _ e: Int) -> Bool {
            let num = Int(String(chars[s...e]))!
            return num >= 10 && num <= 26
        }
        for i in 1...s.count {
            if s[i-1] != "0" { dp[i] += dp[i-1] }
            if i > 1 && isValid(s, i - 2, i - 1) { dp[i] += dp[i-2] }
        }
        return dp[s.count]
    }
}

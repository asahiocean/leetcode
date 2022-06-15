import Foundation

// 1048. Longest String Chain
// https://leetcode.com/problems/longest-string-chain/

class Solution {
    func longestStrChain(_ words: [String]) -> Int {
        var res = 1, dp = [String:Int]()
        for w in words.sorted(by: { $0.count < $1.count }) {
            var val = 1
            for i in w.indices {
                var word = w
                word.remove(at: i)
                val = max(dp[word, default: 0] + 1, val)
            }
            dp[w] = val
            res = max(val, res)
        }
        return res
    }
}

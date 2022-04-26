import Foundation

// 1498. Number of Subsequences That Satisfy the Given Sum Condition
// https://leetcode.com/problems/number-of-subsequences-that-satisfy-the-given-sum-condition/

class Solution {
    func numSubseq(_ n: [Int], _ t: Int) -> Int {
        guard !n.isEmpty else { return 0 }
        let len = n.count, srt = n.sorted(), MOD = 1_000_000_007
        var res = 0, memo = [0:1]
        
        func pwr(_ ts: Int) -> Int {
            if let cnt = memo[ts] { return cnt }
            var val = pwr(ts >> 1) % MOD
            val *= val % MOD
            if ts % 2 == 1 { val *= 2 }
            val %= MOD
            memo[ts] = val
            return val
        }
        func bfs(_ t: Int) -> Int? {
            guard srt[0] <= t else { return nil }
            guard srt[len - 1] > t else { return len - 1 }
            var lhs = 0, rhs = len - 1
            while lhs < rhs {
                let mid = lhs + (rhs - lhs) >> 1
                if srt[mid] > t {
                    rhs = mid - 1
                } else {
                    if mid == len - 1 || srt[mid + 1] > t { return mid }
                    lhs = mid + 1
                }
            }
            return lhs
        }
        for i in 0..<len {
            guard let idx = bfs(t - srt[i]), idx >= i else { continue }
            res += pwr(idx - i )
            res %= MOD
        }
        return res
    }
}

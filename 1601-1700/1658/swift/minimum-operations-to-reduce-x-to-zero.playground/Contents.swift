import Foundation

// 1658. Minimum Operations to Reduce X to Zero
// https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/

class Solution {
    func minOperations(_ n: [Int], _ x: Int) -> Int {
        var val = Int.max, lhs = 0, rhs = n.count, sum = n.reduce(0, +)
        guard sum >= x else { return sum < x ? -1 : rhs }
        for i in 0..<rhs {
            sum -= n[i]
            while sum < x, lhs <= i {
                sum += n[lhs]
                lhs += 1
            }
            guard sum == x else { continue }
            val = min(val, (rhs - 1 - i) + lhs)
        }
        return val != .max ? val : -1
    }
}

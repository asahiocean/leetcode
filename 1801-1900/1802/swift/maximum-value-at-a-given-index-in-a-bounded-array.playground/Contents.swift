import Foundation

// 1802. Maximum Value at a Given Index in a Bounded Array
// https://leetcode.com/problems/maximum-value-at-a-given-index-in-a-bounded-array/

class Solution {
    func maxValue(_ n: Int, _ idx: Int, _ maxSum: Int) -> Int {
        guard n != maxSum else { return 1 }
        var lhs = 1, rhs = maxSum, val = Int.min
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) >> 1
            if check(n, idx, mid) <= maxSum {
                val = max(val, mid)
                lhs = mid + 1
            } else {
                rhs = mid - 1
            }
        }
        return check(n, idx, lhs) <= maxSum ? max(val, lhs) : val
    }
    private func check(_ n: Int, _ i: Int, _ c: Int) -> Int {
        var sum = 0
        sum += c < i + 1 ? (c + 1) * c / 2 + i  + 1 - c : (c * 2 - i) * (i + 1) / 2
        sum += c < n - i ? c * (c - 1) / 2 + n - i - c : (c * 2 - n + i) * (n - 1 - i) / 2
        return sum
    }
}


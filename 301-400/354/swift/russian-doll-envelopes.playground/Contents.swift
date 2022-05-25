import Foundation

// 354. Russian Doll Envelopes
// https://leetcode.com/problems/russian-doll-envelopes/

class Solution {
    func maxEnvelopes(_ env: [[Int]]) -> Int {
        var val = 0, dolls = Array(repeating: 0, count: env.count)
        
        for e in env.sorted(by: { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] }) {
            var lhs = 0, rhs = val
            while lhs < rhs {
                let mid = lhs + (rhs - lhs) / 2
                dolls[mid] < e[1] ? (lhs = mid + 1) : (rhs = mid)
            }
            if lhs == val { val += 1 }
            dolls[lhs] = e[1]
        }
        return val
    }
}

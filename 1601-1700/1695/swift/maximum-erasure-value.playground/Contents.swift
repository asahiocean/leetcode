import Foundation

// 1695. Maximum Erasure Value
// https://leetcode.com/problems/maximum-erasure-value/

class Solution {
    func maximumUniqueSubarray(_ n: [Int]) -> Int {
        var res = 0, val = 0, idx = 0, map = [Int:Int]()
        for i in n.indices {
            let num = n[i]
            val += num
            while idx <= map[num] ?? -1 {
                val -= n[idx]
                idx += 1
            }
            map[num] = i
            res = max(res, val)
        }
        return res
    }
}

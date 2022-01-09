import Foundation

// 696. Count Binary Substrings
// https://leetcode.com/problems/count-binary-substrings/

class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        guard s != "" else { return 0 }
        
        let digs = Array(s)
        var cur = 1, prev = 0, res = 0
        
        for n in 1..<digs.count {
            switch digs[n-1] != digs[n] {
            case true:
                res += min(prev, cur)
                prev = cur
                cur = 1
            default:
                cur += 1
            }
        }
        return res + min(prev, cur)
    }
}

import Foundation

// 318. Maximum Product of Word Lengths
// https://leetcode.com/problems/maximum-product-of-word-lengths/

class Solution {
    func maxProduct(_ w: [String]) -> Int {
        guard !w.isEmpty else { return 0 }
        let len = w.count, wms = w.map{Set($0)}
        var val =  0
        for a in 0..<(len - 1) {
            for b in (a + 1)..<len where wms[a].intersection(wms[b]).isEmpty {
                val = max(val, w[a].count * w[b].count)
            }
        }
        return val
    }
}

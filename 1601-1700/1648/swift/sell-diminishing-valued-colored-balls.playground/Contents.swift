import Foundation

// 1648. Sell Diminishing-Valued Colored Balls
// https://leetcode.com/problems/sell-diminishing-valued-colored-balls/

class Solution {
    func maxProfit(_ inventory: [Int], _ orders: Int) -> Int {
        var res = 0, col = 1, ord = orders
        let srt = inventory.sorted(), mod = 1_000_000_007
        var idx = srt.count - 1
        while idx >= 0 && ord > 0 {
            var cur = srt[idx], pre = idx > 0 ? srt[idx - 1] : 0
            let rnd = min(ord / col, cur - pre)
            ord -= rnd * col
            res = (res + (cur * (cur + 1) - (cur - rnd) * (cur - rnd + 1)) / 2 * col) % mod
            if cur - pre > rnd {
                res = (res + ord * (cur - rnd)) % mod
                break
            }
            col += 1
            idx -= 1
        }
        return res
    }
}

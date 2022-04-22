import Foundation

// 826. Most Profit Assigning Work
// https://leetcode.com/problems/most-profit-assigning-work/

class Solution {
    func maxProfitAssignment(_ dif: [Int], _ prof: [Int], _ w: [Int]) -> Int {
        let srtW = w.sorted { $0 > $1 }
        var idx = 0, res = 0
        for (d,p) in zip(dif, prof).sorted { $0.1 > $1.1 } {
            var cnt = 0
            while idx < w.count && srtW[idx] >= d {
                cnt += 1
                idx += 1
            }
            res += cnt * p
        }
        return res
    }
}

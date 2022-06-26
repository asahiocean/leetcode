import Foundation

// 1423. Maximum Points You Can Obtain from Cards
// https://leetcode.com/problems/maximum-points-you-can-obtain-from-cards/

class Solution {
    func maxScore(_ p: [Int], _ k: Int) -> Int {
        guard !p.isEmpty else { return 0 }
        var sum = [0], len = p.count
        for i in p { sum.append(sum.last! + i) }
        var res = max(sum[k], sum[len] - sum[len - k])
        for i in 1..<k { res = max(res, sum[i] + sum[len] - sum[len - k + i]) }
        return res
    }
}

import Foundation

// 1679. Max Number of K-Sum Pairs
// https://leetcode.com/problems/max-number-of-k-sum-pairs/

class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        let srt = nums.sorted()
        var res = 0, lhs = 0, rhs = nums.count - 1
        while lhs < rhs {
            switch srt[lhs] + srt[rhs] {
            case k:
                lhs += 1
                rhs -= 1
                res += 1
            case ..<k:
                lhs += 1
            default:
                rhs -= 1
            }
        }
        return res
    }
}

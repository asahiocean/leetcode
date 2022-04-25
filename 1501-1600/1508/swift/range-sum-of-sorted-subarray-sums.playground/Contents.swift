import Foundation

// 1508. Range Sum of Sorted Subarray Sums
// https://leetcode.com/problems/range-sum-of-sorted-subarray-sums/

class Solution {
    func rangeSum(_ nums: [Int], _ n: Int, _ l: Int, _ r: Int) -> Int {
        var subsqSums = [Int]()
        for a in 0..<n {
            var cur = 0
            for b in a..<n {
                cur += nums[b]
                subsqSums.append(cur)
            }
        }
        subsqSums.sort()
        var res = 0
        for i in l...r {
            res += subsqSums[i - 1]
            res %= 1_000_000_007
        }
        return res
    }
}

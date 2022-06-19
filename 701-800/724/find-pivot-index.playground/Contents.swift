import Foundation

// 724. Find Pivot Index
// https://leetcode.com/problems/find-pivot-index/

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        var lhs = 0, rhs = nums.reduce(0, +)
        for i in nums.indices {
            lhs += nums[i]
            if lhs == rhs { return i }
            rhs -= nums[i]
        }
        return -1
    }
}

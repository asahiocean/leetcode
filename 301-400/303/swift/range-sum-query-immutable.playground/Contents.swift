import Foundation

// 303. Range Sum Query - Immutable
// https://leetcode.com/problems/range-sum-query-immutable/

class NumArray {
    private let nums: [Int]
    init(_ nums: [Int]) {
        self.nums = nums
    }
    func sumRange(_ l: Int, _ r: Int) -> Int {
        return nums[l...r].reduce(0, +)
    }
}

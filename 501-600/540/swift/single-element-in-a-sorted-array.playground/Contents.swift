import Foundation

// 540. Single Element in a Sorted Array
// https://leetcode.com/problems/single-element-in-a-sorted-array/

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var lhs = 0, rhs = nums.count - 1
        while lhs < rhs {
            var mid = lhs + (rhs - lhs) / 2
            if mid % 2 == 1 { mid = mid - 1 }
            if nums[mid] != nums[mid+1] {
                rhs = mid
            } else {
                lhs = mid + 2
            }
        }
        return nums[lhs]
    }
}

import Foundation

// 153. Find Minimum in Rotated Sorted Array
// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        
        var val: Int = Int.max
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = (right - left) / 2 + left
            if nums[mid] >= nums[left] {
                val = min(val, nums[left])
                left = mid + 1
            } else {
                val = min(val, nums[mid])
                right = mid - 1
            }
        }
        return val
    }
}

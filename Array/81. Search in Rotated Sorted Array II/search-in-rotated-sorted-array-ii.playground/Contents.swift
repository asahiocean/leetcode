import Foundation

// 81. Search in Rotated Sorted Array II
// https://leetcode.com/problems/search-in-rotated-sorted-array-ii/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        
        guard nums.count > 0 else { return false }
        
        var l = 0, // left
            r = nums.count - 1 // right
        
        while l < r {
            let m = (l + r) / 2 // mid
            if nums[m] == target { return true }
            if nums[l] < nums[m] {
                target < nums[m] && target >= nums[l] ? (r = m - 1) : (l = m + 1)
            } else if nums[l] > nums[m] {
                target > nums[m] && target <= nums[r] ? (l = m + 1) : (r = m - 1)
            } else {
                l += 1
            }
        }
        return nums[l] == target
    }
}

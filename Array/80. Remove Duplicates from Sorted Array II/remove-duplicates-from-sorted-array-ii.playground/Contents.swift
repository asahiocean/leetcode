import Foundation

// 80. Remove Duplicates from Sorted Array II
// https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 2 else { return nums.count }
        
        var i = 1
        
        for d in 2..<nums.count where nums[i] != nums[i-1] || nums[i] != nums[d] {
            i += 1
            nums[i] = nums[d]
        }
        return i + 1
    }
}

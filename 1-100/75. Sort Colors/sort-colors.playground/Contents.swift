import Foundation

// 75. Sort Colors
// https://leetcode.com/problems/sort-colors/

class Solution {
    func sortColors(_ nums: inout [Int]) {
        
        var length = Int(nums.indices.last ?? 0)
        var index = 0
        
        while index < length && nums[index] == 0 {
            index += 1
        }
        
        guard index != length else { return }
        
        while length >= 0 && nums[length] == 2 {
            length -= 1
        }
        
        guard length != -1 else { return }
        
        var value = index
        
        while value <= length {
            if nums[value] == 0 {
                nums.swapAt(index, value)
                index += 1
                value += 1
            } else if nums[value] == 2 {
                nums.swapAt(length, value)
                length -= 1
            } else {
                value += 1
            }
        }
    }
}

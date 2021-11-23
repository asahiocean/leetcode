import Foundation

// 75. Sort Colors
// https://leetcode.com/problems/sort-colors/

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var i = 0, j = nums.count - 1
        while i <  nums.count &&  nums[i] == 0 { i += 1 }
        if i == nums.count { return }
        while j >= 0 && nums[j] == 2 { j -= 1 }
        if j == -1 { return }
        var k = i
        while k <= j {
            if nums[k] == 0 {
                nums.swapAt(i, k)
                i += 1; k += 1
            } else if nums[k] == 2 {
                nums.swapAt(j, k); j -= 1
            } else {
                k += 1
            }
        }
    }
}

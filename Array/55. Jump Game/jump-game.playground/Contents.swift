import Foundation

// 55. Jump Game
// https://leetcode.com/problems/jump-game/

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var maxIndex = nums[0]
        for (index, value) in nums.enumerated() {
            if index > maxIndex{ return false }
            maxIndex = max(maxIndex, index + value)
        }
        return true
    }
}

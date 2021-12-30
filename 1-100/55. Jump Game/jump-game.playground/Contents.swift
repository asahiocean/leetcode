import Foundation

// 55. Jump Game
// https://leetcode.com/problems/jump-game/

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var indexMax = nums[0]
        for (i, v) in nums.enumerated() {
            if i > indexMax{ return false }
            indexMax = max(indexMax, i + v)
        }
        return true
    }
}

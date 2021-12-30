import Foundation

// 136. Single Number
// https://leetcode.com/problems/single-number/

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = nums[0]
        nums[1...].forEach { result ^= $0 }
        return result
    }
}

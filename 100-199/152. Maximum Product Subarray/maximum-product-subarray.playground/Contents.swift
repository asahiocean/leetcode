import Foundation

// 152. Maximum Product Subarray
// https://leetcode.com/problems/maximum-product-subarray/

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var (fmin,fmax,value) = (nums[0],nums[0],nums[0])
        for i in 1..<nums.count {
            let a = fmax * nums[i], b = fmin * nums[i]
            (fmax,fmin) = (max(a,b,nums[i]),min(a,b,nums[i]))
            value = max(value, fmax)
        }
        return value
    }
}

// MARK: - Details -

// Runtime: ~16 ms
// Memory Usage: ~14.3 MB

import Foundation

// 198. House Robber
// https://leetcode.com/problems/house-robber/

class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var rob = nums[0], notRob = 0
        
        for i in 1..<nums.count {
            let cr = notRob + nums[i] // current robbed
            let cnr = notRob < rob ? rob : notRob // current not robbed
            (rob,notRob) = (cr,cnr)
        }
        return rob < notRob ? notRob : rob
    }
}

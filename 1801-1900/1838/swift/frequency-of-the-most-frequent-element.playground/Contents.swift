import Foundation

// 1838. Frequency of the Most Frequent Element
// https://leetcode.com/problems/frequency-of-the-most-frequent-element/

class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        let srt = nums.sorted()
        var res = 1, lhs = 0, total = 0
        
        for r in 1..<nums.count {
            total += (srt[r] - srt[r - 1]) * (r - lhs)
            while total > k {
                total -= srt[r] - srt[lhs]
                lhs += 1
            }
            res = max(res, r - lhs + 1)
        }
        return res
    }
}

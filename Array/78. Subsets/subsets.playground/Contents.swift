import Foundation

// 78. Subsets
// https://leetcode.com/problems/subsets/

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else { return [[]] }
        
        var result: [[Int]] = [[]]
        nums.forEach({
            for i in stride(from: 0, to: result.count, by: 1) {
                var subset = result[i]
                subset.append($0)
                result.append(subset)
            }
        })
        return result
    }
}

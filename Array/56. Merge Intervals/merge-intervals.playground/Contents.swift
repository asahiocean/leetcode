import Foundation

// 56. Merge Intervals
// https://leetcode.com/problems/merge-intervals/

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sorted = intervals.sorted(by: {$0[0] < $1[0]})
        var merged = [sorted.first!]
        
        for current in sorted {
            let prev = merged.last![0], prevEnd = merged.last![1]
            let curStart = current[0], curEnd = current[1]
            
            if prevEnd >= curStart {
                merged[merged.count - 1] = [prev, max(prevEnd, curEnd)]
            } else {
                merged.append(current)
            }
        }
        return merged
    }
}

import Foundation

// 56. Merge Intervals
// https://leetcode.com/problems/merge-intervals/

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        
        let sorted = intervals.sorted(by: {$0[0] < $1[0]})
        guard let first = sorted.first else { return [[Int]]() }
        
        var merged = [first]
        
        for current in sorted {
            guard let last = merged.last else { continue }
            
            let prev = last[0]
            let penult = last[1]
            
            let start = current[0], end = current[1]
            
            if penult >= start {
                merged[merged.count - 1] = [prev, max(penult, end)]
            } else {
                merged.append(current)
            }
        }
        return merged
    }
}

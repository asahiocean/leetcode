import Foundation

// 57. Insert Interval
// https://leetcode.com/problems/insert-interval/

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard !intervals.isEmpty else { return [newInterval] }
        guard !newInterval.isEmpty else { return intervals }
        
        var i = 0, result = [[Int]]()
        var new = newInterval
        
        while i < intervals.count, intervals[i][1] < new[0] {
            result.append(intervals[i])
            i += 1
        }
        
        while i < intervals.count, intervals[i][0] <= new[1] {
            new[0] = min(intervals[i][0], new[0])
            new[1] = max(intervals[i][1], new[1])
            i += 1
        }
        
        result.append(new)
        
        for i in i..<intervals.count {
            result.append(intervals[i])
        }
        return result
    }
}

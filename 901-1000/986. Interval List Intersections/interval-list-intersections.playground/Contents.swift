import Foundation

// 986. Interval List Intersections
// https://leetcode.com/problems/interval-list-intersections/

class Solution {
    private typealias Interval = (start: Int, end: Int)
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        let intervalA: [Interval] = firstList.sorted(by: { $0[0] < $1[0] }).map{($0[0],$0[1])}
        let intervalB: [Interval] = secondList.sorted(by: { $0[0] < $1[0] }).map{($0[0],$0[1])}
        var result: [[Int]] = [[Int]]()
        for a in intervalA {
            for b in intervalB {
                if b.start > a.end { break }
                if b.end < a.start { continue }
                result.append([max(b.start,a.start),min(a.end, b.end)])
            }
        }
        return result
    }
}

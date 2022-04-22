import Foundation

// 436. Find Right Interval
// https://leetcode.com/problems/find-right-interval/

class Solution {
    func findRightInterval(_ ints: [[Int]]) -> [Int] {
        guard !ints.isEmpty else { return [] }
        guard ints.count > 1 else { return [-1] }
        var map = [Int:Int](), srt = [Int](), res = [Int]()
        
        for (i, e) in ints.enumerated() {
            map[e[0]] = i
            srt.append(e[0])
        }
        srt.sort()
        
        for i in ints {
            var min = Int.min, lhs = 0, rhs = ints.count - 1
            var found = false
            while lhs <= rhs {
                let mid = lhs + (rhs - lhs) / 2
                if srt[mid] >= i[1] {
                    min = srt[mid]
                    rhs = mid - 1
                    found = true
                } else {
                    lhs = mid + 1
                }
            }
            res.append(found ? (map[min] ?? -1) : -1)
        }
        return res
    }
}

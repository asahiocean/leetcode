import Foundation

// 1574. Shortest Subarray to be Removed to Make Array Sorted
// https://leetcode.com/problems/shortest-subarray-to-be-removed-to-make-array-sorted/

class Solution {
    func findLengthOfShortestSubarray(_ a: [Int]) -> Int {
        var end = a.count - 1, lhs = 0, rhs = end
        var nolast: Bool { lhs < end }
        while nolast && a[lhs] <= a[lhs + 1] { lhs += 1 } // last index search
        guard nolast else { return 0 }
        while rhs > lhs && a[rhs] >= a[rhs - 1] { rhs -= 1 } // first index search
        var res = min(rhs, end - lhs), idx = 0
        while a[end] >= a[0] && idx <= lhs {
            if a[rhs] >= a[idx] {
                res = min(res, rhs - idx - 1)
                idx += 1
            } else if rhs < end { // bfs last element
                var tmp = end
                while rhs < tmp {
                    let mid = (tmp + rhs) / 2
                    a[mid] < a[idx] ? (rhs = mid + 1) : (tmp = mid)
                }
                rhs = tmp
            } else { break }
        }
        return res
    }
}

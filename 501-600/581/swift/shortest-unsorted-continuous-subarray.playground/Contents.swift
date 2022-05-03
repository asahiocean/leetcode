import Foundation

// 581. Shortest Unsorted Continuous Subarray
// https://leetcode.com/problems/shortest-unsorted-continuous-subarray/

class Solution {
    func findUnsortedSubarray(_ n: [Int]) -> Int {
        guard n.count != 2 else { return n[0] <= n[1] ? 0 : 2 }
        let srt = n.sorted()
        var idx = 0
        while idx < n.count && srt[idx] == n[idx] { idx += 1 }
        guard idx != n.count else { return 0 }
        var end = n.count - 1
        while end >= 0 && srt[end] == n[end] { end -= 1 }
        return end - idx + 1
    }
}

import Foundation

// 456. 132 Pattern
// https://leetcode.com/problems/132-pattern/

class Solution {
    func find132pattern(_ n: [Int]) -> Bool {
        guard n.count > 2 else { return false }
        var val = Int.min, arr = [Int]()
        for i in stride(from: n.count - 1, through: 0, by: -1) {
            if n[i] < val { return true }
            while !arr.isEmpty, n[i] > arr.last! {
                val = max(val, arr.removeLast())
            }
            arr.append(n[i])
        }
        return false
    }
}

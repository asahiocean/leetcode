import Foundation

// 1480. Running Sum of 1d Array
// https://leetcode.com/problems/running-sum-of-1d-array/

class Solution {
    func runningSum(_ n: [Int]) -> [Int] {
        var sum = 0
        return n.isEmpty ? [] : n.map { sum += $0; return sum }
    }
}

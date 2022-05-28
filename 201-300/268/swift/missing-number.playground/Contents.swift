import Foundation

// 268. Missing Number
// https://leetcode.com/problems/missing-number/

class Solution {
    func missingNumber(_ n: [Int]) -> Int {
        return n.count * (n.count + 1) / 2 - n.reduce(0, +)
    }
}

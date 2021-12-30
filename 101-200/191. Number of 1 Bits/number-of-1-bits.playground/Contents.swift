import Foundation

// 191. Number of 1 Bits
// https://leetcode.com/problems/number-of-1-bits/

class Solution {
    func hammingWeight(_ n: Int) -> Int {
        return n.nonzeroBitCount
    }
}

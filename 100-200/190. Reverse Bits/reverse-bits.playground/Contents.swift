import Foundation

// 190. Reverse Bits
// https://leetcode.com/problems/reverse-bits/

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n, result = 0
        for bit in 0 ..< Int32.bitWidth {
            result += (n & 1) << (Int32.bitWidth - 1 - bit)
            n >>= 1
        }
        return result
    }
}

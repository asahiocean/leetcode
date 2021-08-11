import Foundation

// 263. Ugly Number
// https://leetcode.com/problems/ugly-number/

class Solution {
    func isUgly(_ n: Int) -> Bool {
        guard n != 0 else { return false }
        var n = n
        for k in [2, 3, 5] {
            while n % k == 0 { n /= k }
        }
        return n == 1
    }
}

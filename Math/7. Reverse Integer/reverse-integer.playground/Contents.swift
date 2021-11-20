import Foundation

// 7. Reverse Integer
// https://leetcode.com/problems/reverse-integer/

class Solution {
    func reverse(_ x: Int) -> Int {
        var r = 0, x = x
        while x != 0 {
            r = r * 10
            r = r + x % 10
            x /= 10
        }
        if r < Int32.min || r > Int32.max { return 0 }
        return r
    }
}

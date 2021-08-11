import Foundation

// 202. Happy Number
// https://leetcode.com/problems/happy-number/

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var visited = Set<Int>(), n = n
        while 1 != n && !visited.contains(n) {
            visited.insert(n)
            var sum : Double = 0
            while n > 0 {
                sum += pow(Double((n % 10)), 2)
                n = n / 10
            }
            n = Int(sum)
        }
        return n == 1
    }
}

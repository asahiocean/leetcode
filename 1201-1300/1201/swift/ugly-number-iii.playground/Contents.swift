import Foundation

// 1201. Ugly Number III
// https://leetcode.com/problems/ugly-number-iii/

class Solution {
    func nthUglyNumber(_ n: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
        let ab = a * b / gcd(a,b)
        let bc = b * c / gcd(b,c)
        let ac = a * c / gcd(a,c)
        let abc = a * bc / gcd(a,bc)
        
        let mnd = min(a,b,c)
        var lhs = mnd, rhs = mnd * n
        
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) >> 1
            let cnt = mid / a + mid / b + mid / c - mid / ab - mid / ac - mid / bc + mid / abc
            if cnt >= n { rhs = mid } else { lhs = mid + 1 }
        }
        return lhs
    }
    private func gcd(_ a: Int, _ b: Int) -> Int { b == 0 ? a : gcd(b, a % b) }
}

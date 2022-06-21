import Foundation

// 1642. Furthest Building You Can Reach
// https://leetcode.com/problems/furthest-building-you-can-reach/

class Solution {
    func furthestBuilding(_ h: [Int], _ b: Int, _ l: Int) -> Int {
        var lhs = 1, rhs = h.count
        while lhs != rhs {
            let mid = (lhs + rhs + 1) / 2
            var arb = [Int]()
            for i in 1..<mid {
                let lhi = h[i-1], rhi = h[i]
                if rhi > lhi { arb.append(rhi - lhi) }
            }
            arb.sorted()[0..<max(0, arb.count - l)].reduce(0,+) > b ? (rhs = mid - 1) : (lhs = mid)
        }
        return rhs - 1
    }
}

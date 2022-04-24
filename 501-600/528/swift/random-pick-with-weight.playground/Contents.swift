import Foundation

// 528. Random Pick with Weight
// https://leetcode.com/problems/random-pick-with-weight/

class Solution {

    private var sums: [Int]!

    init(_ w: [Int]) {
        self.sums = w
        for i in 1..<sums.count { sums[i] += sums[i-1]; }
    }

    func pickIndex() -> Int {
        let idx = Int.random(in: 0..<sums[sums.count-1]) + 1
        var lhs = 0, rhs = sums.count - 1
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) / 2
            guard sums[mid] != idx else { return mid }
            sums[mid] < idx ? (lhs = mid + 1) : (rhs = mid)
        }
        return lhs
    }
}

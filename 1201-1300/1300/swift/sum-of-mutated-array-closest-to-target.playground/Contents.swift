import Foundation

// 1300. Sum of Mutated Array Closest to Target
// https://leetcode.com/problems/sum-of-mutated-array-closest-to-target/

class Solution {
    func findBestValue(_ a: [Int], _ t: Int) -> Int {
        guard !a.isEmpty else { return 0 }
        let srt = a.sorted(), len = a.count
        var lhs = 0, rhs = srt.last!, pref = [Int](repeating: 0, count: len + 1)
        a.indices.forEach { i in pref[i + 1] = pref[i] + srt[i] }
        
        func find(_ n: Int) -> Int {
            guard let idx = srt.index(where: { $0 > n }) else { return pref.last! }
            return pref[idx] + n * (len - idx)
        }
        
        while lhs < rhs {
            let mid = (lhs + rhs) >> 1
            find(mid) >= t ? (rhs = mid) : (lhs = mid + 1)
        }
        return abs(find(lhs) - t) < abs(find(lhs - 1) - t) ? lhs : (lhs - 1)
    }
}

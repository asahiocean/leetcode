// 1712. Ways to Split Array Into Three Subarrays
// https://leetcode.com/problems/ways-to-split-array-into-three-subarrays/

class Solution {
    func waysToSplit(_ nums: [Int]) -> Int {
        let len = nums.count
        var pref = [0]
        for n in nums { pref.append(pref.last! + n) }
        var idxM = 2, res = 0
        for l in 1...(len - 2) {
            let sumL = pref[l]
            idxM = max(idxM, l + 1)
            while idxM < len && pref[idxM] - sumL < sumL  {
                idxM += 1
            }
            guard idxM < len else { break }
            var lhs = idxM, rhs = len - 1
            while lhs <= rhs {
                let mid = (lhs + rhs) >> 1
                if pref[len] - pref[mid] < pref[mid] - sumL {
                    rhs = mid - 1
                } else {
                    lhs = mid + 1
                }
            }
            res = (res + rhs - idxM + 1) % 1_000_000_007
        }
        return res
    }
}
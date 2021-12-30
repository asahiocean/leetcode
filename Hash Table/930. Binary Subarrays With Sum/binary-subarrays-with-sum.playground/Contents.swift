import Foundation

// https://leetcode.com/problems/binary-subarrays-with-sum/

class Solution {
    func numSubarraysWithSum(_ A: [Int], _ S: Int) -> Int {
        var res = 0, ind = [-1]
        for i in 0..<A.count where A[i] == 1 {
            ind.append(i)
        }
        ind.append(A.count)
        if S == 0 {
            var res = 0
            for i in 0..<(ind.count-1) {
                let count = ind[i+1] - ind[i] - 1
                res += (count+1) * count / 2
            }
            return res
        }
        for i in 0..<(ind.count - S - 1) {
            let r = i + S
            res += (ind[i+1] - ind[i]) * (ind[r+1] - ind[r])
        }
        return res
    }
}

#warning("TODO: Tests")

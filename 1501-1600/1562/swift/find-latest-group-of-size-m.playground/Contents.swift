import Foundation

// 1562. Find Latest Group of Size M
// https://leetcode.com/problems/find-latest-group-of-size-m/

class Solution {
    func findLatestStep(_ arr: [Int], _ m: Int) -> Int {
        var res = -1
        let len = arr.count
        var start = [Int?](repeating: nil, count: len)
        var end = start, dict = [Int:Set<[Int]>]()
        
        for i in 0..<len {
            let idx = arr[i] - 1
            start[idx] = idx
            end[idx] = idx
            var flag = false
            if idx + 1 < len, let idx2 = start[idx + 1] {
                flag = true
                dict[idx2 - idx]?.remove([idx + 1, idx2])
                start[idx] = idx2
                start[idx + 1] = nil
                dict[idx2 - idx + 1, default: []].insert([idx,idx2])
            }
            if idx > 0, let idx2 = end[idx - 1] {
                flag = true
                dict[idx - idx2]?.remove([idx2,idx - 1])
                end[idx] = idx2
                end[idx - 1] = nil
                dict[idx - idx2 + 1, default: []].insert([idx2,idx])
            }
            if flag, let lhs = end[idx], let rhs = start[idx] {
                start[idx] = nil
                end[idx] = nil
                start[lhs] = rhs
                end[rhs] = lhs
                dict[idx - lhs + 1]?.remove([lhs,idx])
                dict[rhs - idx + 1]?.remove([idx,rhs])
                dict[rhs - lhs + 1, default: []].insert([lhs,rhs])
            } else {
                dict[1, default: []].insert([idx,idx])
            }
            if let idxs = dict[m], !idxs.isEmpty { res = max(res, i + 1) }
        }
        return res
    }
}

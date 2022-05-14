import Foundation

// 743. Network Delay Time
// https://leetcode.com/problems/network-delay-time/

class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var ctm = [[Int]](repeating: [Int](repeating: .max, count: n + 1), count: n + 1)
        for t in times { ctm[t[0]][t[1]] = t[2] }
        for i in 0...n { ctm[i][i] = 0 }
        for a in 1...n {
            for b in 1...n where !(ctm[b][a] == .max) {
                for c in 1...n where !(ctm[a][c] == .max) {
                    ctm[b][c] = min(ctm[b][c], ctm[b][a] + ctm[a][c])
                }
            }
        }
        var dtok = ctm[k]
        dtok.removeFirst()
        let dmax = dtok.max()!
        return dmax == .max ? -1 : dmax
    }
}

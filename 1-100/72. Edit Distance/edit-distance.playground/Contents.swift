import Foundation

// 72. Edit Distance
// https://leetcode.com/problems/edit-distance/

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let M = word1.count, N = word2.count
        guard !word1.isEmpty && !word2.isEmpty else { return max(N,M) }
        let w1ch = [Character](word1), w2ch = [Character](word2)
        var editDist = Array<[Int]>(repeating: [Int](repeating: 0, count: N), count: M)
        
        for j in 0..<N {
            editDist[0][j] = w1ch[0] == w2ch[j] ? j : (j == 0 ? 0 : editDist[0][j-1]) + 1
        }
        for i in 0..<M {
            editDist[i][0] = w1ch[i] == w2ch[0] ? i : (1 + (i == 0 ? 0 : editDist[i - 1][0]))
        }
        for i in 1..<M {
            for j in 1..<N {
                editDist[i][j] = min(editDist[i-1][j] + 1,
                                     editDist[i][j-1] + 1,
                                     editDist[i-1][j-1] + (w2ch[j] == w1ch[i] ? 0 : 1))
            }
        }
        return editDist[M-1][N-1]
    }
}

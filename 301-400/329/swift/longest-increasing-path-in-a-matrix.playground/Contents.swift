import Foundation

// 329. Longest Increasing Path in a Matrix
// https://leetcode.com/problems/longest-increasing-path-in-a-matrix/

class Solution {
    func longestIncreasingPath(_ m: [[Int]]) -> Int {
        guard !m.isEmpty else { return 0 }
        
        let row = m.count, col = m[0].count
        var res = 0, path = [[Int]](repeating: [Int](repeating: 0, count: col), count: row)
                
        func dfs(_ x: Int, _ y: Int) {
            guard path[x][y] == 0 else { return }
            path[x][y] = 1
            let dx = [0,1,0,-1], dy = [1,0,-1,0]
            for i in 0..<dx.count {
                let xdx = x + dx[i], ydy = y + dy[i]
                if xdx >= 0, xdx < row, ydy >= 0, ydy < col, m[xdx][ydy] < m[x][y] {
                    dfs(xdx, ydy)
                    path[x][y] = max(path[x][y], path[xdx][ydy] + 1)
                }
            }
        }
        for x in 0..<row {
            for y in 0..<col {
                dfs(x, y)
                res = max(res, path[x][y])
            }
        }
        return res
    }
}

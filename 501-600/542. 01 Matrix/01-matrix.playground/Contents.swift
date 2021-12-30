import Foundation

// 542. 01 Matrix
// https://leetcode.com/problems/01-matrix/

class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let matCount = mat.count, n = mat[0].count
        var mat = mat
        var queue: [(Int, Int)] = []
        
        for i in 0..<matCount {
            for k in 0..<n {
                if mat[i][k] == 0 {
                    queue.append((i, k))
                } else {
                    mat[i][k] = -1
                }
            }
        }
        
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var dist = 1
        
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0..<count {
                let (i, j) = queue.removeFirst()
                
                for d in directions {
                    let x = i + d.0
                    let y = j + d.1
                    if x < 0 || x >= matCount || y < 0 || y >= n || mat[x][y] != -1 {
                        continue
                    }
                    mat[x][y] = dist
                    queue.append((x, y))
                }
            }
            dist += 1
        }
        return mat
    }
}

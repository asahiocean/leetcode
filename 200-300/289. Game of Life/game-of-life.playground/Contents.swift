import Foundation

// 289. Game of Life
// https://leetcode.com/problems/game-of-life/

class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let row = board.count, col = board[0].count
        guard row > 0, col > 0 else { return }
        
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == 0, ones(board, i, j) == 3 {
                    board[i][j] = 3
                }
                if board[i][j] == 1 {
                    let count = ones(board, i, j)
                    if count < 2 || count > 3 { board[i][j] = 2 }
                }
            }
        }
        for i in 0..<row {
            for j in 0..<col { board[i][j] %= 2 }
        }
    }
    
    private func ones(_ board: [[Int]], _ i: Int, _ j: Int) -> Int {
        let dxy = [[0,1], [0,-1], [1,0], [-1, 0], [1,1], [-1,-1], [1,-1], [-1,1]]
        var ones = 0, row = board.count, col = board[0].count
        for d in dxy {
            let x = d[0] + i, y = d[1] + j
            guard x >= 0, x < row, y >= 0, y < col else { continue }
            if board[x][y] == 1 || board[x][y] == 2 { ones += 1 }
        }
        return ones
    }
}

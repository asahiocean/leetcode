import Foundation

// 130. Surrounded Regions
// https://leetcode.com/problems/surrounded-regions/

class Solution {
    func solve(_ board: inout [[Character]]) {
        for r in board.indices {
            for c in board[r].indices where board[r][c] == "O" {
                var curr = board
                if dfs(&curr, r, c) { board = curr }
            }
        }
    }
    
    // valid region board
    private func dfs(_ board: inout [[Character]], _ r: Int, _ c: Int) -> Bool {
        if r < 0 || r >= board.count || c < 0 || c >= board[r].count { return false }
        if board[r][c] != "O" { return true }
        
        board[r][c] = "X"
        
        for (dx, dy) in [(1,0), (-1,0), (0,1), (0,-1)] {
            let nr = r + dx, nc = c + dy
            if !dfs(&board, nr, nc) { return false }
        }
        return true
    }
}

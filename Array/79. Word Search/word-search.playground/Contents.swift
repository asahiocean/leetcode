import Foundation

// 79. Word Search
// https://leetcode.com/problems/word-search/

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var ans = false
        let rowLength = board.count, colLength = board[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: board[0].count), count: board.count)
        let dx = [0,0,-1,1], dy = [-1,1,0,0]
        
        let chars = [Character](word)
        
        func searchChar(x: Int,y: Int,charIndex: Int) {
            guard charIndex < word.count else {
                ans = true
                return
            }
            
            guard !ans else { return }
            visited[x][y] = true
            
            for i in 0...3 {
                let nextX = x + dx[i], nextY = y + dy[i]
                
                if nextX >= 0 && nextX < rowLength &&
                    nextY >= 0 && nextY < colLength &&
                    !visited[nextX][nextY] && board[nextX][nextY] == chars[charIndex]
                {
                    searchChar(x: nextX, y: nextY, charIndex: charIndex + 1)
                }
            }
            visited[x][y] = false
        }
        
        for i in 0..<board.count {
            for j in 0..<board[0].count where board[i][j] == word.first {
                if word.count == 1 { return true }
                
                searchChar(x: i, y: j, charIndex: 1)
                if ans { return true }
            }
        }
        return false
    }
}

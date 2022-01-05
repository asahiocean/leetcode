import Foundation

// 79. Word Search
// https://leetcode.com/problems/word-search/

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var result = false
        let lenB = board.count, lenW = word.count, rows = lenB, cols = board[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: lenB)
        
        let chars = [Character](word)
        
        func searchChar(x: Int, y: Int, _ idx: Int) {
            guard idx < lenW else { result = true; return }
            
            guard !(result) else { return }
            visited[x][y] = true
            
            for i in 0...3 {
                let nxtX = x + [0,0,-1,1][i], nxtY = y + [-1,1,0,0][i]
                
                if nxtX >= 0 && nxtX < rows && nxtY >= 0 && nxtY < cols &&
                    !visited[nxtX][nxtY] && board[nxtX][nxtY] == chars[idx]
                {
                    searchChar(x: nxtX, y: nxtY, idx + 1)
                }
            }
            visited[x][y] = false
        }
        
        for x in 0..<lenB {
            for y in 0..<cols where board[x][y] == word.first {
                if lenW == 1 { return true }
                searchChar(x: x, y: y, 1)
                if result { return true }
            }
        }
        
        return false
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.045 (0.047) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED")
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE")
        XCTAssertEqual(value, true)
    }
    
    func test2() {
        let value = solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB")
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()

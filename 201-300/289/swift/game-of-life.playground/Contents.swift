import Foundation

// 289. Game of Life
// https://leetcode.com/problems/game-of-life/

class Solution {
    func gameOfLife(_ b: inout [[Int]]) {
        guard !b.isEmpty else { return }
        let row = b.count, col = b[0].count
        for r in 0..<row {
            for c in 0..<col {
                let cur = b[r][c], stp = step(r, c)
                b[r][c] = (cur == 0 && stp == 3) ? 3 : (cur == 1 && (stp < 2 || stp > 3)) ? 2 : cur
            }
        }
        for r in 0..<row { for c in 0..<col { b[r][c] %= 2 } }
        func step(_ r: Int, _ c: Int) -> Int {
            var val = 0
            for (x,y) in [(0,1),(0,-1),(1,0),(-1,0),(1,1),(-1,-1),(1,-1),(-1,1)] {
                guard (0..<row) ~= x+r, (0..<col) ~= y+c else { continue }
                if (1...2) ~= b[x+r][y+c] { val += 1 }
            }
            return val
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        var board = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
        solution.gameOfLife(&board)
        XCTAssertEqual(board, [[0,0,0],[1,0,1],[0,1,1],[0,1,0]])
    }
    
    func test1() {
        var board = [[1,1],[1,0]]
        solution.gameOfLife(&board)
        XCTAssertEqual(board, [[1,1],[1,1]] )
    }
}

Tests.defaultTestSuite.run()

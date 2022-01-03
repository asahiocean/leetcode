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

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// Surrounded regions should not be on the border, which means that any 'O' on the
    /// border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not
    /// connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are
    /// adjacent cells connected horizontally or vertically.
    func test0() {
        var board: [[Character]] = [["X","X","X","X"],
                                    ["X","O","O","X"],
                                    ["X","X","O","X"],
                                    ["X","O","X","X"]]
        solution.solve(&board)
        XCTAssertEqual(board, [["X","X","X","X"],
                               ["X","X","X","X"],
                               ["X","X","X","X"],
                               ["X","O","X","X"]])
    }
    
    func test1() {
        var board: [[Character]] = [["X"]]
        solution.solve(&board)
        XCTAssertEqual(board, [["X"]])
    }
}

Tests.defaultTestSuite.run()

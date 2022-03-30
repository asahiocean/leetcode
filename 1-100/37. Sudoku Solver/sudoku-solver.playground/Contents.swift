import Foundation

// 37. Sudoku Solver
// https://leetcode.com/problems/sudoku-solver/

class Solution {
    internal typealias Char = Character
    func solveSudoku(_ board: inout [[Char]]) {
        guard board.count != 0 || board[0].count != 0 else { return }
        helper(&board)
    }
    
    private func helper(_ board: inout [[Char]]) -> Bool {
        for r in 0..<board.count {
            for c in 0..<board[0].count where board[r][c] == "." {
                for n in 1...9 where isValid(board, Char("\(n)"), r, c) {
                    board[r][c] = Char("\(n)")
                    if helper(&board) {
                        return true
                    } else {
                        board[r][c] = "."
                    }
                }
                return false
            }
        }
        return true
    }
    private func isValid(_ board: [[Char]], _ ch: Char, _ r: Int,  _ c: Int) -> Bool {
        for i in 0...8 {
            if board[r][i] == ch || board[i][c] == ch { return false }
            if board[(r / 3) * 3 + i / 3][(c / 3) * 3 + i % 3] == ch { return false }
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 1 test, with 0 failures (0 unexpected) in 0.265 (0.267) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test() {
        var arrChars: [[Character]] = [["5","3",".",".","7",".",".",".","."],
                                       ["6",".",".","1","9","5",".",".","."],
                                       [".","9","8",".",".",".",".","6","."],
                                       ["8",".",".",".","6",".",".",".","3"],
                                       ["4",".",".","8",".","3",".",".","1"],
                                       ["7",".",".",".","2",".",".",".","6"],
                                       [".","6",".",".",".",".","2","8","."],
                                       [".",".",".","4","1","9",".",".","5"],
                                       [".",".",".",".","8",".",".","7","9"]]
        solution.solveSudoku(&arrChars)
        XCTAssertEqual(arrChars, [["5","3","4","6","7","8","9","1","2"],
                                  ["6","7","2","1","9","5","3","4","8"],
                                  ["1","9","8","3","4","2","5","6","7"],
                                  ["8","5","9","7","6","1","4","2","3"],
                                  ["4","2","6","8","5","3","7","9","1"],
                                  ["7","1","3","9","2","4","8","5","6"],
                                  ["9","6","1","5","3","7","2","8","4"],
                                  ["2","8","7","4","1","9","6","3","5"],
                                  ["3","4","5","2","8","6","1","7","9"]])
    }
}

Tests.defaultTestSuite.run()

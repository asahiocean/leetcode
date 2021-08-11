import Foundation

// 37. Sudoku Solver
// https://leetcode.com/problems/sudoku-solver/

class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        guard board.count != 0 || board[0].count != 0 else { return }
        helper(&board)
    }
    
    private func helper(_ board: inout [[Character]]) -> Bool {
        func isValid(_ i: Int, _ j: Int, _ num: Character) -> Bool {
            let m = board.count, n = board[0].count
            for x in 0..<n where board[i][x] == num { return false }    // row
            for y in 0..<m where board[y][j] == num { return false }    // col
            for x in i / 3 * 3..<i / 3 * 3 + 3 {                        // square
                for y in j / 3 * 3..<j / 3 * 3 + 3 where board[x][y] == num { return false }
            }
            return true
        }
        for i in 0..<board.count {
            for j in 0..<board[0].count where board[i][j] == "." {
                for num in 1...9 where isValid(i, j, Character("\(num)")) {
                    board[i][j] = Character("\(num)")
                    if helper(&board) {
                        return true
                    } else {
                        board[i][j] = "."
                    }
                }
                return false
            }
        }
        return true
    }
}

import XCTest

// Executed 1 test, with 0 failures (0 unexpected) in 0.498 (0.499) seconds

class Tests: XCTestCase {
    private let s = Solution()
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
        s.solveSudoku(&arrChars)
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

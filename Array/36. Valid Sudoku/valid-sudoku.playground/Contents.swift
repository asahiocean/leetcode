import Foundation

// 36. Valid Sudoku
// https://leetcode.com/problems/valid-sudoku/

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for i in board.indices {
            let rows = board[i].filter { $0 != "." }
            let cols = board.map{ $0[i] }.filter { $0 != "." }
            let n = (a: 3 * (i / 3), b: 3 * (i % 3))
            let blks = board[n.a ..< n.a + 3].flatMap{$0[n.b ..< n.b + 3]}.filter{$0 != "."}
            if rows.count != Set(rows).count ||
                cols.count != Set(cols).count ||
                blks.count != Set(blks).count { return false }
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.076 (0.078) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isValidSudoku([["5","3",".",".","7",".",".",".","."],
                                            ["6",".",".","1","9","5",".",".","."],
                                            [".","9","8",".",".",".",".","6","."],
                                            ["8",".",".",".","6",".",".",".","3"],
                                            ["4",".",".","8",".","3",".",".","1"],
                                            ["7",".",".",".","2",".",".",".","6"],
                                            [".","6",".",".",".",".","2","8","."],
                                            [".",".",".","4","1","9",".",".","5"],
                                            [".",".",".",".","8",".",".","7","9"]])
        XCTAssertEqual(value, true)
    }
    func test1() {
        let value = solution.isValidSudoku([["8","3",".",".","7",".",".",".","."],
                                            ["6",".",".","1","9","5",".",".","."],
                                            [".","9","8",".",".",".",".","6","."],
                                            ["8",".",".",".","6",".",".",".","3"],
                                            ["4",".",".","8",".","3",".",".","1"],
                                            ["7",".",".",".","2",".",".",".","6"],
                                            [".","6",".",".",".",".","2","8","."],
                                            [".",".",".","4","1","9",".",".","5"],
                                            [".",".",".",".","8",".",".","7","9"]])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()

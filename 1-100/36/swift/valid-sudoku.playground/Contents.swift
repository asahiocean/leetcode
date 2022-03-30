import Foundation

// 36. Valid Sudoku
// https://leetcode.com/problems/valid-sudoku/

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for i in board.indices {
            
            let rows = board[i].filter{ $0 != "." }
            let cols = board.map{$0[i]}.filter { $0 != "." }
            
            let val = (a: 3 * (i / 3), b: 3 * (i % 3))
            let blks = board[val.a..<val.a+3].flatMap{$0[val.b..<val.b+3]}.filter{$0 != "."}
            
            if rows.count != Set(rows).count ||
               cols.count != Set(cols).count ||
               blks.count != Set(blks).count { return false }
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.036 (0.038) seconds

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
    
    // Same as Example 1, except with the 5 in the top left corner being modified to 8.
    // Since there are two 8's in the top left 3x3 sub-box, it is invalid.
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

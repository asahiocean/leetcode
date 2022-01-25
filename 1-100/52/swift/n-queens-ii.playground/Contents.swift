import Foundation

// 52. N-Queens II
// https://leetcode.com/problems/n-queens-ii/

class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var value = 0
        let rows = [Int](repeating: 0, count: n)
        var stack: [(rows: [Int], index: Int)] = [(rows, 0)]
        
        while !stack.isEmpty {
            let cur = stack.removeLast()
            let rows = cur.rows, ci = cur.index
            if ci == rows.count { value += 1; continue }
            for i in 0..<n {
                var next = rows
                next[ci] = i
                func detected(_ rows: [Int], _ i: Int) -> Bool {
                    var row = i - 1
                    while row >= 0 {
                        let rr = rows[row], ri = rows[i]
                        if rr == ri || abs(rr - ri) == (i-row) { return true }
                        row -= 1
                    }
                    return false
                }
                if !detected(next, ci) { stack.append((next, ci + 1)) }
            }
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.033 (0.035) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // There are two distinct solutions to the 4-queens puzzle as shown.
    func test0() {
        let value = solution.totalNQueens(4)
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.totalNQueens(1)
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()

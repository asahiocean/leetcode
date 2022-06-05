import Foundation

// 52. N-Queens II
// https://leetcode.com/problems/n-queens-ii/

class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var res = 0, stack = [(Array(repeating: 0, count: n), 0)]
        
        while !stack.isEmpty {
            var cur = stack.removeLast(), row = cur.0, idx = cur.1
            if idx == row.count { res += 1; continue }
            for i in 0..<n {
                row[idx] = i
                if !detect(idx) { stack.append((row, idx + 1)) }
            }
            func detect(_ i: Int) -> Bool {
                var idx = i - 1
                while idx >= 0 {
                    let lhs = row[idx], rhs = row[i]
                    if lhs == rhs || abs(lhs - rhs) == (i - idx) { return true }
                    idx -= 1
                }
                return false
            }
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.017 (0.019) seconds

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

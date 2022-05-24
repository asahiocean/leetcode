import Foundation

// 32. Longest Valid Parentheses
// https://leetcode.com/problems/longest-valid-parentheses/

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var val = 0, stack = [-1]
        for (i, ch) in s.enumerated() {
            guard ch != "(" else { stack.append(i); continue }
            guard stack.count > 1 else { stack[0] = i; continue }
            stack.removeLast()
            val = max(val, i - stack.last!)
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The longest valid parentheses substring is "()".
    func test0() {
        let res = solution.longestValidParentheses("(()")
        XCTAssertEqual(res, 2)
    }
    
    // The longest valid parentheses substring is "()()".
    func test1() {
        let res = solution.longestValidParentheses(")()())")
        XCTAssertEqual(res, 4)
    }
    
    func test2() {
        let res = solution.longestValidParentheses("")
        XCTAssertEqual(res, 0)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 32. Longest Valid Parentheses
// https://leetcode.com/problems/longest-valid-parentheses/

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var val = 0, start = 0, stack: [Int] = []
        
        for (i,ch) in s.enumerated() {
            if ch == "(" {
                stack.append(i)
            } else {
                if !stack.isEmpty {
                    stack.removeLast()
                    if let last = stack.last {
                        val = max(val, i - last)
                    } else {
                        val = max(val, i - start + 1)
                    }
                } else {
                    start = i + 1
                }
            }
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.013 (0.015) seconds

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

import Foundation

// 32. Longest Valid Parentheses
// https://leetcode.com/problems/longest-valid-parentheses/

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var value = 0, start = 0, stack = [Int]()
        
        for (i,ch) in s.enumerated() {
            switch ch == "(" {
            case true:
                stack.append(i)
            default:
                if !stack.isEmpty {
                    stack.removeLast()
                    if let last = stack.last {
                        value = max(value, i - last)
                    } else {
                        value = max(value, i - start + 1)
                    }
                } else {
                    start = i + 1
                }
            }
        }
        return value
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.013 (0.015) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.longestValidParentheses("(()")
        XCTAssertEqual(res, 2)
    }
    func test1() {
        let res = s.longestValidParentheses(")()())")
        XCTAssertEqual(res, 4)
    }
    func test2() {
        let res = s.longestValidParentheses("")
        XCTAssertEqual(res, 0)
    }
}

Tests.defaultTestSuite.run()

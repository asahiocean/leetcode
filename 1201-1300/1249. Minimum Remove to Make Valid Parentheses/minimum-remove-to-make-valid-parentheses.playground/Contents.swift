import Foundation

// 1249. Minimum Remove to Make Valid Parentheses
// https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/

class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        
        let len = s.count, chars = [Character](s)
        
        var parentheses: [Int] = []
        var leftChars = [Bool](repeating: true, count: len)
        var value = ""
        
        for i in 0..<len {
            switch chars[i] {
            case "(":
                parentheses.append(i)
            case ")":
                if parentheses.isEmpty {
                    leftChars[i]  = false
                } else {
                    parentheses.popLast()
                }
            default:
                break
            }
        }
        for i in 0..<parentheses.count {
            leftChars[parentheses[i]] = false
        }
        for i in 0..<chars.count where leftChars[i] {
            value.append(chars[i])
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
    func test0() {
        let value = solution.minRemoveToMakeValid("lee(t(c)o)de)")
        XCTAssertEqual(value, "lee(t(c)o)de")
    }
    
    func test1() {
        let value = solution.minRemoveToMakeValid("a)b(c)d")
        XCTAssertEqual(value, "ab(c)d")
    }
    
    /// An empty string is also valid.
    func test2() {
        let value = solution.minRemoveToMakeValid("))((")
        XCTAssertEqual(value, "")
    }
}

Tests.defaultTestSuite.run()

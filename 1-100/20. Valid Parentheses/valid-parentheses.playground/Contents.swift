import Foundation

// 20. Valid Parentheses
// https://leetcode.com/problems/valid-parentheses

class Solution {
    func isValid(_ s: String) -> Bool {
        
        if s.count % 2 != 0 { return false }
        var stack: [Character] = []
        
        for ch in s {
            switch ch {
            case "(": stack.append(")")
            case "[": stack.append("]")
            case "{": stack.append("}")
            default:
                if stack.isEmpty || stack.removeLast() != ch {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    private let s = Solution()
    
    func test0() {
        let value = s.isValid("()")
        XCTAssertTrue(value)
    }
    func test1() {
        let value = s.isValid("()[]{}")
        XCTAssertTrue(value)
    }
    func test2() {
        let value = s.isValid("(]")
        XCTAssertFalse(value)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 856. Score of Parentheses
// https://leetcode.com/problems/score-of-parentheses/

class Solution {
    private let parL: Character = "("
    func scoreOfParentheses(_ s: String) -> Int {
        
        var value = 0, result = 0
        let array = Array(s)
        
        for i in 0 ..< array.count {
            if array[i] == parL {
                value += 1
            } else {
                value -= 1
                if array[i-1] == parL { result += 1 << value }
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.008 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test1() {
        let value = solution.scoreOfParentheses("()")
        XCTAssertEqual(value, 1)
    }
    
    func test2() {
        let value = solution.scoreOfParentheses("(())")
        XCTAssertEqual(value, 2)
    }
    
    func test3() {
        let value = solution.scoreOfParentheses("()()")
        XCTAssertEqual(value, 2)
    }
    
    func test4() {
        let value = solution.scoreOfParentheses("(()(()))")
        XCTAssertEqual(value, 6)
    }
}

Tests.defaultTestSuite.run()

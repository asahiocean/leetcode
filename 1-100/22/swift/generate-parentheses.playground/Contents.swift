import Foundation

// 22. Generate Parentheses
// https://leetcode.com/problems/generate-parentheses/

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else { return [""] }
        
        var map: [Int:[String]] = [:], result: [String] = []
        if let parentheses = map[n] { return parentheses }
        
        for i in 0..<n {
            for l in generateParenthesis(i) {
                for r in generateParenthesis(n - 1 - i) {
                    result.append("(" + l + ")" + r)
                }
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.generateParenthesis(3)
        XCTAssertEqual(value, ["()()()","()(())","(())()","(()())","((()))"])
    }
    
    func test1() {
        let value = solution.generateParenthesis(1)
        XCTAssertEqual(value, ["()"])
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 1678. Goal Parser Interpretation
// https://leetcode.com/problems/goal-parser-interpretation/

class Solution {
    func interpret(_ command: String) -> String {
        if !(1...100).contains(command.count) { return "" }
        let word = command.replacingOccurrences(of: "()", with: "o")
        return word.replacingOccurrences(of: "(al)", with: "al")
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.035) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The Goal Parser interprets the command as follows:
    // G -> G
    // () -> o
    // (al) -> al
    // The final concatenated result is "Goal".
    func test0() {
        let value = solution.interpret("G()(al)")
        XCTAssertEqual(value, "Goal")
    }
    
    func test1() {
        let value = solution.interpret("G()()()()(al)")
        XCTAssertEqual(value, "Gooooal")
    }
    
    func test3() {
        let value = solution.interpret("(al)G(al)()()G")
        XCTAssertEqual(value, "alGalooG")
    }
}

Tests.defaultTestSuite.run()

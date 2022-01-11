import Foundation

// 557. Reverse Words in a String III
// https://leetcode.com/problems/reverse-words-in-a-string-iii/

class Solution {
    func reverseWords(_ s: String) -> String {
        let separated: [String] = s.components(separatedBy: .whitespaces)
        let reversed: [String] = separated.map({String($0.reversed())})
        let result: String = reversed.joined(separator: " ")
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.020 (0.022) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.reverseWords("Let's take LeetCode contest")
        XCTAssertEqual(value, "s'teL ekat edoCteeL tsetnoc")
    }
    
    func test1() {
        let value = solution.reverseWords("God Ding")
        XCTAssertEqual(value, "doG gniD")
    }
}

Tests.defaultTestSuite.run()

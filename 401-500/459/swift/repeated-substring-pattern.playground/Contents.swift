import Foundation

// 459. Repeated Substring Pattern
// https://leetcode.com/problems/repeated-substring-pattern/

class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let str = (s + s)
        let sub = str[str.index(after: str.startIndex)..<str.index(before: str.endIndex)]
        return sub.contains(s)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // It is the substring "ab" twice.
    func test0() {
        let value = solution.repeatedSubstringPattern("abab")
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.repeatedSubstringPattern("aba")
        XCTAssertEqual(value, false)
    }
    
    // It is the substring "abc" four times or the substring "abcabc" twice.
    func test2() {
        let value = solution.repeatedSubstringPattern("abcabcabcabc")
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()

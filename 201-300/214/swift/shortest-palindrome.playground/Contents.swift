import Foundation

// 214. Shortest Palindrome
// https://leetcode.com/problems/shortest-palindrome/

class Solution {
    func shortestPalindrome(_ s: String) -> String {
        let len = s.count
        let arr = Array(s), arrRev = Array(s.reversed())
        for i in 0..<len where arr.prefix(len - i) == arrRev.suffix(len - i) {
            return arrRev.prefix(i - 0) + s
        }
        return ""
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.shortestPalindrome("aacecaaa")
        XCTAssertEqual(value, "aaacecaaa")
    }
    
    func test1() {
        let value = solution.shortestPalindrome("abcd")
        XCTAssertEqual(value, "dcbabcd")
    }
}

Tests.defaultTestSuite.run()

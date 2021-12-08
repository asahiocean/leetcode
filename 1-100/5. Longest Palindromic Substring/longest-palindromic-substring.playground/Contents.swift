import Foundation

// 5. Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring/

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else { return s }
        var l = -1, r = -1, max  = 1
        let ch = Array<Character>(s), c = s.count
        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: c), count: c)
        var i = c - 1
        while i >= 0 {
            for j in i..<c {
                dp[i][j] = ch[i] == ch[j] && (j - i < 2 || dp[i + 1][j - 1])
                if dp[i][j] {
                    if j - i + 1 > max {
                        l = i; r = j
                        max = j - i  + 1
                    }
                }
            }
            i -= 1
        }
        return  l == -1 ? String(ch[0]):String(ch[l...r])
    }
}

// MARK: - Test Cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let s = Solution()
    
    func test0() {
        let res = s.longestPalindrome("babad")
        XCTAssertEqual(res, "aba")
    }
    func test1() {
        let res = s.longestPalindrome("cbbd")
        XCTAssertEqual(res, "bb")
    }
    func test2() {
        let res = s.longestPalindrome("a")
        XCTAssertEqual(res, "a")
    }
    func test3() {
        let res = s.longestPalindrome("ac")
        XCTAssertEqual(res, "a")
    }
}

Tests.defaultTestSuite.run()

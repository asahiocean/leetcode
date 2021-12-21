import Foundation

// 5. Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring/

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else { return s }
        var left = -1, right = -1, max  = 1
        let chars = [Character](s)
        let strLenght = s.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: strLenght), count: strLenght)
        var index = strLenght - 1
        while index >= 0 {
            for j in index..<strLenght {
                dp[index][j] = chars[index] == chars[j] && (j - index < 2 || dp[index + 1][j - 1])
                if dp[index][j] {
                    if j - index + 1 > max {
                        left = index
                        right = j
                        max = j - index  + 1
                    }
                }
            }
            index -= 1
        }
        return left == -1 ? String(chars[0]) : String(chars[left...right])
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let res = solution.longestPalindrome("babad")
        XCTAssertEqual(res, "aba")
    }
    func test1() {
        let res = solution.longestPalindrome("cbbd")
        XCTAssertEqual(res, "bb")
    }
    func test2() {
        let res = solution.longestPalindrome("a")
        XCTAssertEqual(res, "a")
    }
    func test3() {
        let res = solution.longestPalindrome("ac")
        XCTAssertEqual(res, "a")
    }
}

Tests.defaultTestSuite.run()

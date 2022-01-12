import Foundation

// 5. Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring/

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let lnS = s.count
        guard lnS > 1 else { return s }
        
        let chars = [Character](s)
        
        var idx = lnS - 1, left = -1, right = -1, max = 1
        
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: lnS), count: lnS)
        
        while idx >= 0 {
            for j in idx..<lnS {
                dp[idx][j] = chars[idx] == chars[j] && (j - idx < 2 || dp[idx + 1][j - 1])
                if dp[idx][j], j - idx + 1 > max {
                    left = idx
                    right = j
                    max = j - idx + 1
                }
            }
            idx -= 1
        }
        return left == -1 ? String(chars[0]) : String(chars[left...right])
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // "aba" is also a valid answer.
    func test0() {
        let value = solution.longestPalindrome("babad")
        XCTAssertEqual(value, "aba")
    }
    
    func test1() {
        let value = solution.longestPalindrome("cbbd")
        XCTAssertEqual(value, "bb")
    }
    
    func test2() {
        let value = solution.longestPalindrome("a")
        XCTAssertEqual(value, "a")
    }
    
    func test3() {
        let value = solution.longestPalindrome("ac")
        XCTAssertEqual(value, "a")
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 5. Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring/

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let len = s.count, arr = Array(s)
        if len <= 1 { return s }
        var lhs = 0, rhs = 0, dp = Array(repeating: Array(repeating: false, count: len), count: len)
        for i in 1..<len {
            for j in 0..<i where arr[j] == arr[i] && (dp[j+1][i-1] || i - j <= 2) {
                dp[j][i] = true
                if i - j > rhs - lhs {
                    lhs = j
                    rhs = i
                }
            }
        }
        return String(arr[lhs...rhs])
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

class Tests {
    
    private typealias sol = Solution
    
    static func test0() {
        let value = sol().longestPalindrome("babad")
        print(value == "bab")
    }
    
    static func test1() {
        let value = sol().longestPalindrome("cbbd")
        print(value == "bb")
    }
}

Tests.test0()
Tests.test1()

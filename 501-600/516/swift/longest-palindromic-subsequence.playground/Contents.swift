import Foundation

// 516. Longest Palindromic Subsequence
// https://leetcode.com/problems/longest-palindromic-subsequence/

class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        
        let len = s.count, array = [Character](s)
        var dp = [[Int]](repeating: [Int](repeating: 0, count: len), count: len)
        var subs = len - 1
        
        while subs >= 0 {
            dp[subs][subs] = 1
            for k in (subs + 1)..<len {
                if array[subs] == array[k] {
                    dp[subs][k] = dp[subs + 1][k - 1] + 2
                } else {
                    dp[subs][k] = max(dp[subs + 1][k], dp[subs][k - 1])
                }
            }
            subs -= 1
        }
        return dp[0][len - 1]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.011 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.longestPalindromeSubseq("bbbab")
        XCTAssertEqual(value, 4)
    }
    
    func test1() {
        let value = solution.longestPalindromeSubseq("cbbd")
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()

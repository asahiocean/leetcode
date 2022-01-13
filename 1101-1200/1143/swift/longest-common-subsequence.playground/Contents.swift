import Foundation

// 1143. Longest Common Subsequence
// https://leetcode.com/problems/longest-common-subsequence/

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        
        if text1.isEmpty || text2.isEmpty { return 0 }
        guard 1 <= text1.count && text2.count <= 1000 else { return 0 }
        
        var result = 0
        
        let arrText1 = Array(text1), arrText2 = Array(text2)
        let lenArr1 = arrText1.count, lenArr2 = arrText2.count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: lenArr2 + 1), count: lenArr1 + 1)
        
        for i in 1...lenArr1 {
            for j in 1...lenArr2 {
                dp[i][j] = arrText1[i-1] == arrText2[j-1] ? dp[i-1][j-1] + 1 : max(dp[i-1][j], dp[i][j-1])
                result = max(result, dp[i][j])
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.022 (0.024) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The longest common subsequence is "ace" and its length is 3.
    func test0() {
        let value = solution.longestCommonSubsequence("abcde", "ace")
        XCTAssertEqual(value, 3)
    }
    
    // The longest common subsequence is "abc" and its length is 3.
    func test1() {
        let value = solution.longestCommonSubsequence("abc", "abc")
        XCTAssertEqual(value, 3)
    }
    
    // There is no such common subsequence, so the result is 0.
    func test2() {
        let value = solution.longestCommonSubsequence("abc", "def")
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 1143. Longest Common Subsequence
// https://leetcode.com/problems/longest-common-subsequence/

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var result = 0
        
        if text1.isEmpty || text2.isEmpty { return result }
        guard 1 <= text1.count && text2.count <= 1000 else { return result }
        
        let arrT1 = Array(text1), arrT2 = Array(text2)
        var dp = [[Int]](repeating: [Int](repeating: 0, count: arrT2.count + 1), count: arrT1.count + 1)
        
        for i in 1...arrT1.count {
            for j in 1...arrT2.count {
                dp[i][j] = arrT1[i-1] == arrT2[j-1] ? dp[i-1][j-1] + 1 : max(dp[i-1][j], dp[i][j-1])
                result = max(result, dp[i][j])
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.048 (0.050) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.longestCommonSubsequence("abcde", "ace")
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.longestCommonSubsequence("abc", "abc")
        XCTAssertEqual(value, 3)
    }
    
    func test2() {
        let value = solution.longestCommonSubsequence("abc", "def")
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

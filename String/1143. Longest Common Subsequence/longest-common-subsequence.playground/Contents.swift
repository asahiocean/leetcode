import Foundation

// https://leetcode.com/problems/longest-common-subsequence/
// Discuss: https://vk.cc/c3RWeU

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1.isEmpty || text2.isEmpty { return 0 }
        guard 1 <= text1.count && text2.count <= 1000 else { return 0 }
        let a = Array(text1), b = Array(text2)
        var result = 0
        var dp = Array<[Int]>(repeating: [Int](repeating: 0, count: b.count+1), count: a.count+1)
        for i in 1...a.count {
            for j in 1...b.count {
                dp[i][j] = a[i-1] == b[j-1] ? dp[i-1][j-1] + 1 : max(dp[i-1][j], dp[i][j-1])
                result = max(result, dp[i][j])
            }
        }
        return result
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.048 (0.050) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.longestCommonSubsequence("abcde", "ace")
        XCTAssertEqual(res, 3)
    }
    func test1() {
        let res = s.longestCommonSubsequence("abc", "abc")
        XCTAssertEqual(res, 3)
    }
    func test2() {
        let res = s.longestCommonSubsequence("abc", "def")
        XCTAssertEqual(res, 0)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 132. Palindrome Partitioning II
// https://leetcode.com/problems/palindrome-partitioning-ii/

class Solution {
    func minCut(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        let arr = Array(s), len = arr.count
        
        var palindromes = [[Bool]](repeating: [Bool](repeating: false, count: len), count: len)
        
        for n in 0..<len {
            for i in 0...n where arr[i] == arr[n] && (n - i < 2 || palindromes[i + 1][n - 1]) {
                palindromes[i][n] = true
            }
        }
        
        var dp = [Int](repeating: 0, count: len)
        
        for i in 0..<dp.count { dp[i] = i }
        
        for i in stride(from: 1, to: len, by: 1) {
            if palindromes[0][i] {
                dp[i] = 0
            } else {
                for j in 0..<i where palindromes[j + 1][i] {
                    dp[i] = min(dp[j] + 1, dp[i])
                }
            }
        }
        return dp[len - 1]
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.023 (0.025) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The palindrome partitioning ["aa","b"] could be produced using 1 cut.
    func test0() {
        let value = solution.minCut("aab")
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.minCut("a")
        XCTAssertEqual(value, 0)
    }
    
    func test2() {
        let value = solution.minCut("ab")
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()

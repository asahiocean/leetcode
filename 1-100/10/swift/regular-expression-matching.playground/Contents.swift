import Foundation

// 10. Regular Expression Matching
// https://leetcode.com/problems/regular-expression-matching/

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        
        let lenS = s.count, lenP = p.count
        let arrS = Array(s), arrP = Array(p)
        
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: lenP + 1), count: lenS + 1)
        dp[lenS][lenP] = true
        
        for i in stride(from: lenS, through: 0, by: -1) {
            for j in stride(from: lenP - 1, through: 0, by: -1) {
                
                let first = i < lenS && (arrS[i] == arrP[j] || arrP[j] == ".")
                
                if j + 1 < lenP && arrP[j + 1] == "*" {
                    dp[i][j] = dp[i][j + 2] || first && dp[i + 1][j]
                } else {
                    dp[i][j] = first && dp[i + 1][j + 1]
                }
            }
        }
        return dp[0][0]
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.020 (0.022) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // "a" does not match the entire string "aa".
    func test0() {
        let value = solution.isMatch("aa", "a")
        XCTAssertEqual(value, false)
    }
    
    // '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
    func test1() {
        let value = solution.isMatch("aa", "a*")
        XCTAssertEqual(value, true)
    }
    
    // ".*" means "zero or more (*) of any character (.)".
    func test2() {
        let value = solution.isMatch("ab", ".*")
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()

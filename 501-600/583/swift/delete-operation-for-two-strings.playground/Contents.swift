import Foundation

// 583. Delete Operation for Two Strings
// https://leetcode.com/problems/delete-operation-for-two-strings/

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word2 == word1 { return 0 }
        
        let rows = word1.count, cols = word2.count
        
        if rows == 0 || cols == 0 { return rows + cols }
        
        let arrW1 = [Character](word1)
        let arrW2 = [Character](word2)
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        
        for c in 0..<cols {
            if arrW2[c] == arrW1[0] {
                dp[0][c] = 1
            } else if c == 0 {
                dp[0][0] = 0
            } else {
                dp[0][c] = dp[0][c - 1]
            }
        }
        
        for r in 0..<rows {
            dp[r][0] = arrW1[r] == arrW2[0] ? 1 : r == 0 ? 0 : dp[r - 1][0]
        }
        
        for i in 1..<rows {
            for j in 1..<cols {
                func valMax(_ n: Int = 0) -> Int {
                    return max(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1] + n)
                }
                dp[i][j] = arrW1[i] == arrW2[j] ? valMax(1) : valMax()
            }
        }
        
        return rows + cols - 2 * dp[rows - 1][cols - 1]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.018 (0.020) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // You need one step to make "sea" to "ea" and another step to make "eat" to "ea".
    func test0() {
        let value = solution.minDistance("sea", "eat")
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.minDistance("leetcode", "etco")
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()


import Foundation

// 343. Integer Break
// https://leetcode.com/problems/integer-break/

class Solution {
    func integerBreak(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n + 1)
        for i in 2...n {
            for j in 1...i / 2 {
                let val1 = j <= 3 ? j : dp[j]
                let val2 = i - j <= 3 ? (i - j) : dp[i - j]
                dp[i] = max(dp[i], val1 * val2)
            }
        }
        return dp.last!
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 2 = 1 + 1, 1 × 1 = 1
    func test0() {
        let value = solution.integerBreak(2)
        XCTAssertEqual(value, 1)
    }
    
    // 10 = 3 + 3 + 4, 3 × 3 × 4 = 36
    func test1() {
        let value = solution.integerBreak(10)
        XCTAssertEqual(value, 36)
    }
}

Tests.defaultTestSuite.run()

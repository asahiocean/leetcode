import Foundation

// 264. Ugly Number II
// https://leetcode.com/problems/ugly-number-ii/

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        
        var dp = [Int](repeating: 0, count: n)
        dp[0] = 1
        
        var p2 = 0, p3 = 0, p5 = 0
        
        for i in 1..<n {
            dp[i] = min(2 * dp[p2], 3 * dp[p3], 5 * dp[p5])
            if dp[i] >= 2 * dp[p2] { p2 += 1 }
            if dp[i] >= 3 * dp[p3] { p3 += 1 }
            if dp[i] >= 5 * dp[p5] { p5 += 1 }
        }
        return dp[n - 1]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// [1, 2, 3, 4, 5, 6, 8, 9, 10, 12] is the sequence of the first 10 ugly numbers.
    func test0() {
        let value = solution.nthUglyNumber(10)
        XCTAssertEqual(value, 12)
    }
    
    /// 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.
    func test1() {
        let value = solution.nthUglyNumber(1)
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()

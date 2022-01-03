import Foundation

// 309. Best Time to Buy and Sell Stock with Cooldown
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        let cnt = prices.count
        guard cnt > 1 else { return 0 }
        
        var value = 0
        var dp = [Int](repeating: 0, count: cnt)
        
        for i in 1..<prices.count {
            for k in (0..<i).reversed() {
                dp[i] = max(dp[i], prices[i] - prices[k] + (k >= 2 ? dp[k - 2] : 0))
            }
            dp[i] = max(dp[i], dp[i - 1])
            value = max(value, dp[i])
        }
        
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// transactions = [buy, sell, cooldown, buy, sell]
    func test0() {
        let value = solution.maxProfit([1,2,3,0,2])
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.maxProfit([1])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

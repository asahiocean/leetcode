import Foundation

// 121. Best Time to Buy and Sell Stock
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else { return 0 }
        
        var buyDay = 0, profit = 0
        
        for i in prices.indices.dropFirst() {
            buyDay = max(0, buyDay + prices[i] - prices[i-1])
            profit = max(profit, buyDay)
        }
        return profit
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
    // Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
    func test0() {
        let value = solution.maxProfit([7,1,5,3,6,4])
        XCTAssertEqual(value, 5)
    }
    
    // In this case, no transactions are done and the max profit = 0.
    func test1() {
        let value = solution.maxProfit([7,6,4,3,1])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

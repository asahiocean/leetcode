import Foundation

// 121. Best Time to Buy and Sell Stock
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else { return 0 }
        var profit = 0, buyDay = 0
        for i in prices.indices.dropFirst() {
            buyDay = max(0, buyDay + prices[i] - prices[i-1])
            profit = max(profit, buyDay)
        }
        return profit
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        XCTAssertEqual(s.maxProfit([7,1,5,3,6,4]), 5)
    }
    func test1() {
        XCTAssertEqual(s.maxProfit([7,6,4,3,1]), 0)
    }
}

Tests.defaultTestSuite.run()

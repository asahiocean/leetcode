import Foundation

// 714. Best Time to Buy and Sell Stock with Transaction Fee
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/

class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let len = prices.count
        guard len > 1 else { return 0 }
        var empty = 0
        var hold = -prices[0]
        for i in 1..<len {
            let price = prices[i]
            empty = max(empty, hold + price - fee)
            hold = max(empty - price, hold)
        }
        return max(hold, empty)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// The maximum profit can be achieved by:
    /// - Buying at prices[0] = 1
    /// - Selling at prices[3] = 8
    /// - Buying at prices[4] = 4
    /// - Selling at prices[5] = 9
    /// The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.
    func test0() {
        let value = solution.maxProfit([1,3,2,8,4,9], 2)
        XCTAssertEqual(value, 8)
    }
    
    func test1() {
        let value = solution.maxProfit([1,3,7,5,10,3], 3)
        XCTAssertEqual(value, 6)
    }
}

Tests.defaultTestSuite.run()

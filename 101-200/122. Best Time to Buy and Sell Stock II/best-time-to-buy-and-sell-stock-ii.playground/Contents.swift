import Foundation

// 122. Best Time to Buy and Sell Stock II
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var i = 1, profit = 0
        while i < prices.count {
            let cur = prices[i], last = prices[i-1]
            if cur > last { profit += cur - last }
            i += 1
        }
        return profit
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
    /// Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
    /// Total profit is 4 + 3 = 7.
    func test0() {
        let value = solution.maxProfit([7,1,5,3,6,4])
        XCTAssertEqual(value, 7)
    }
    
    /// Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
    /// Total profit is 4.
    func test1() {
        let value = solution.maxProfit([1,2,3,4,5])
        XCTAssertEqual(value, 4)
    }
    
    /// There is no way to make a positive profit, so we never buy the stock to achieve the maximum profit of 0.
    func test2() {
        let value = solution.maxProfit([7,6,4,3,1])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

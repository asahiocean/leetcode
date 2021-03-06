import Foundation

// 123. Best Time to Buy and Sell Stock III
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let len = prices.count
        guard len > 1 else { return 0 }
        
        var profit = 0, maxVals: [Int] = []
        
        var maxVal = 0 {
            didSet { maxVals.append(maxVal) }
        }
        
        var first = prices.first!
        
        for price in prices {
            maxVal = max(price - first, maxVal)
            first = min(price, first)
        }
        
        maxVal = 0
        
        var last = prices.last!
        
        for i in (0..<len).reversed() {
            let price = prices[i]
            maxVal = max(last - price, maxVal)
            last = max(price, last)
            profit = max(profit, maxVal + maxVals[i])
        }
        return profit
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.044 (0.046) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
    // Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.
    func test0() {
        let value = solution.maxProfit([3,3,5,0,0,3,1,4])
        XCTAssertEqual(value, 6)
    }
    
    // Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
    // Note that you cannot buy on day 1, buy on day 2 and sell them later, as you
    // are engaging multiple transactions at the same time. You must sell before buying again.
    func test1() {
        let value = solution.maxProfit([1,2,3,4,5])
        XCTAssertEqual(value, 4)
    }
    
    // In this case, no transaction is done, i.e. max profit = 0.
    func test2() {
        let value = solution.maxProfit([7,6,4,3,1])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

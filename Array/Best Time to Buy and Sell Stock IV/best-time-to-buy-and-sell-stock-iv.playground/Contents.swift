import Foundation

// 188. Best Time to Buy and Sell Stock IV
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv

class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        guard k > 0 && prices.count > 1 else { return 0 }
        guard k >= prices.count/2 else {
            var low = [Int](repeating: prices[0], count: k)
            var res = [Int](repeating: 0, count: k)
            for i in prices.indices {
                for s in 0..<k {
                    let mj = low[s], pn = prices[i]
                    low[s] = min(mj, s == 0 ? pn : pn - res[s-1])
                    res[s] = max(res[s], pn - mj)
                }
            }
            return res[k - 1]
        }
        var res = 0
        for i in 1..<prices.count where prices[i] > prices[i-1] {
            res += (prices[i] - prices[i-1])
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test1() {
        let value = solution.maxProfit(2, [2,4,1])
        XCTAssertEqual(value, 2)
    }
    func test2() {
        let value = solution.maxProfit(2, [3,2,6,5,0,3])
        XCTAssertEqual(value, 7)
    }
}

Tests.defaultTestSuite.run()

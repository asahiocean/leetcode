import Foundation

// 121. Best Time to Buy and Sell Stock
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

class Solution {
    func maxProfit(_ p: [Int]) -> Int {
        guard !p.isEmpty else { return 0 }
        var bday = 0, prof = 0
        for i in p.indices.dropFirst() {
            bday = max(0, bday + p[i] - p[i-1])
            prof = max(prof, bday)
        }
        return prof
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

class Tests {
    
    private typealias sol = Solution
    
    // Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
    // Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
    static func testExample1() {
        let val = sol().maxProfit([7,1,5,3,6,4])
        print(val == 5)
    }
    
    // In this case, no transactions are done and the max profit = 0.
    static func testExample2() {
        let val = sol().maxProfit([7,6,4,3,1])
        print(val == 0)
    }
}

Tests.testExample1()
Tests.testExample2()

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

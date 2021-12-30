import Foundation

// 746. Min Cost Climbing Stairs
// https://leetcode.com/problems/min-cost-climbing-stairs/

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        
        let count = cost.count
        guard count > 0 else { return 0 }
        
        var dp = [Int](repeating: .max, count: count + 1)
        
        (dp[0], dp[1]) = (cost[0], cost[1])
        
        for i in 2...count {
            dp[i] = min(dp[i - 1], dp[i - 2]) + (i != count ? cost[i] : 0)
        }
        return dp[count]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.019 (0.021) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// You will start at index 1.
    /// - Pay 15 and climb two steps to reach the top.
    /// The total cost is 15.
    func test0() {
        let value = solution.minCostClimbingStairs([10,15,20])
        XCTAssertEqual(value, 15)
    }
    
    /// You will start at index 0.
    /// - Pay 1 and climb two steps to reach index 2.
    /// - Pay 1 and climb two steps to reach index 4.
    /// - Pay 1 and climb two steps to reach index 6.
    /// - Pay 1 and climb one step to reach index 7.
    /// - Pay 1 and climb two steps to reach index 9.
    /// - Pay 1 and climb one step to reach the top.
    /// The total cost is 6.
    func test1() {
        let value = solution.minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])
        XCTAssertEqual(value, 6)
    }
}

Tests.defaultTestSuite.run()

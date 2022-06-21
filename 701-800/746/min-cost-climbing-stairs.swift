import Foundation

// 746. Min Cost Climbing Stairs
// https://leetcode.com/problems/min-cost-climbing-stairs/

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        guard !cost.isEmpty else { return 0 }
        let len = cost.count
        var dp = [Int](repeating: .max, count: len + 1)
        (dp[0], dp[1]) = (cost[0], cost[1])
        for i in 2...len { dp[i] = min(dp[i-1], dp[i-2]) + (i != len ? cost[i] : 0) }
        return dp[len]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.019 (0.021) seconds

class Tests {
    
    private typealias sol = Solution
    
    /*
    You will start at index 1.
    - Pay 15 and climb two steps to reach the top.
    The total cost is 15.
    */
    static func testExample1() {
        let val = sol().minCostClimbingStairs([10,15,20])
        print(val == 15)
    }
    
    /*
    You will start at index 0.
     - Pay 1 and climb two steps to reach index 2.
     - Pay 1 and climb two steps to reach index 4.
     - Pay 1 and climb two steps to reach index 6.
     - Pay 1 and climb one step to reach index 7.
     - Pay 1 and climb two steps to reach index 9.
     - Pay 1 and climb one step to reach the top.
    The total cost is 6.
    */
    static func testExample2() {
        let val = sol().minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])
        print(val == 6)
    }
}

Tests.testExample1()
Tests.testExample2()

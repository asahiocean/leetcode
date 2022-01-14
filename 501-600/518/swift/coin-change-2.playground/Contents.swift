import Foundation

// 518. Coin Change 2
// https://leetcode.com/problems/coin-change-2/

class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        
        var dp = [Int](repeating: 0, count: (amount + 1))
        dp[0] = 1
        
        for coin in coins.sorted() where coin <= amount {
            for x in coin...amount {
                dp[x] += dp[x - coin]
            }
        }
        
        return dp[amount]
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // There are four ways to make up the amount:
    // 5=5
    // 5=2+2+1
    // 5=2+1+1+1
    // 5=1+1+1+1+1
    func test0() {
        let value = solution.change(5, [1,2,5])
        XCTAssertEqual(value, 4)
    }
    
    // The amount of 3 cannot be made up just with coins of 2.
    func test1() {
        let value = solution.change(3, [2])
        XCTAssertEqual(value, 0)
    }
    
    func test2() {
        let value = solution.change(10, [10])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()

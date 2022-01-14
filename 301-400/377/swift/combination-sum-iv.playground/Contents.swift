import Foundation

// 377. Combination Sum IV
// https://leetcode.com/problems/combination-sum-iv/

class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        
        var dp = [Int](repeating: 0, count: (target + 1))
        dp[0] = 1
        
        let sort = nums.sorted()
        
        for i in 1...target {
            for n in sort {
                if i < n { break }
                if dp[i - n] > (Int.max - dp[i]) {
                    continue
                }
                dp[i] += dp[i - n]
            }
        }
        
        return dp.last!
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The possible combination ways are:
    // (1, 1, 1, 1)
    // (1, 1, 2)
    // (1, 2, 1)
    // (1, 3)
    // (2, 1, 1)
    // (2, 2)
    // (3, 1)
    // Note that different sequences are counted as different combinations.
    func test0() {
        let value = solution.combinationSum4([1,2,3], 4)
        XCTAssertEqual(value, 7)
    }
    
    func test1() {
        let value = solution.combinationSum4([9], 3)
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

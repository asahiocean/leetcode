import Foundation

// 410. Split Array Largest Sum
// https://leetcode.com/problems/split-array-largest-sum/

class Solution {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        let len = nums.count
        var dp = [[Int]](repeating: [Int](repeating: .max, count: m + 1), count: len + 1)
        var pref = [Int](repeating: 0, count: len + 1)
        for i in 0..<len {
            pref[i + 1] = pref[i] + nums[i]
        }
        dp[0][0] = 0
        for a in 1...len {
            for b in 1...m {
                for c in 0..<a {
                    dp[a][b] = min(dp[a][b], max(dp[c][b - 1], pref[a] - pref[c]))
                }
            }
        }
        return dp[len][m]
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.024 (0.026) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // There are four ways to split nums into two subarrays.
    // The best way is to split it into [7,2,5] and [10,8],
    // where the largest sum among the two subarrays is only 18.
    func test0() {
        let value = solution.splitArray([7,2,5,10,8],2)
        XCTAssertEqual(value, 18)
    }
    
    func test1() {
        let value = solution.splitArray([1,2,3,4,5],2)
        XCTAssertEqual(value, 9)
    }
    
    func test2() {
        let value = solution.splitArray([1,4,4],3)
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()

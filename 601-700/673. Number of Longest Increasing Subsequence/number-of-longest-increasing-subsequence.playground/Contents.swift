import Foundation

// 673. Number of Longest Increasing Subsequence
// https://leetcode.com/problems/number-of-longest-increasing-subsequence/

class Solution {
    private typealias Max = (len: Int, cnt: Int)
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        let len = nums.count
        guard len > 0 else { return 0 }
        
        var maxLen = 1
        var dp = [Max](repeating: (1,1), count: len)
        
        for i in 1..<len {
            for j in 0..<i where nums[j] < nums[i] {
                let currLen = dp[j].len + 1
                if currLen > dp[i].len {
                    dp[i] = (currLen, dp[j].cnt)
                } else if currLen == dp[i].len {
                    dp[i].cnt += dp[j].cnt
                }
            }
            maxLen = max(dp[i].len, maxLen)
        }
        
        var result = 0
        for val in dp where val.len == maxLen {
            result += val.cnt
        }
        
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The two longest increasing subsequences are [1, 3, 4, 7] and [1, 3, 5, 7].
    func test0() {
        let value = solution.findNumberOfLIS([1,3,5,4,7])
        XCTAssertEqual(value, 2)
    }
    
    // The length of longest continuous increasing subsequence is 1, and there are 5 subsequences' length is 1, so output 5.
    func test1() {
        let value = solution.findNumberOfLIS([2,2,2,2,2])
        XCTAssertEqual(value, 5)
    }
}

Tests.defaultTestSuite.run()

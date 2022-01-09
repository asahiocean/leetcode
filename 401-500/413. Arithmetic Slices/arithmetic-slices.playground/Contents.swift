import Foundation

// 413. Arithmetic Slices
// https://leetcode.com/problems/arithmetic-slices/

class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        
        let len = nums.count
        var value = 0
        guard len > 2 else { return value }
        
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: len), count: len)
        
        for i in 1..<len - 1 where 2 * nums[i] == nums[i - 1] + nums[i + 1] {
            dp[i - 1][i + 1] = true
            value += 1
        }
        
        guard len > 3 else { return value }
        
        for ssl in (4...len) { // subsequence length
            for p in 0...(len - ssl) {
                let endIdx = (p + ssl - 1)
                if 2 * nums[endIdx - 1] == nums[endIdx] + nums[endIdx - 2] && dp[p][endIdx - 1] {
                    dp[p][endIdx] = true
                    value += 1
                }
            }
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.018 (0.020) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// We have 3 arithmetic slices in nums: [1, 2, 3], [2, 3, 4] and [1,2,3,4] itself.
    func test0() {
        let value = solution.numberOfArithmeticSlices([1,2,3,4])
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.numberOfArithmeticSlices([1])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 918. Maximum Sum Circular Subarray
// https://leetcode.com/problems/maximum-sum-circular-subarray/

class Solution {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        
        guard !nums.isEmpty else { return 0 }
        
        var total:  Int = 0
        var totalMax: Int = nums[0]
        var totalMin: Int = nums[0]
        var curMax: Int = 0
        var curMin: Int = 0
        
        for num in nums {
            // THE ORDER IS IMPORTANT
            curMax   = max(curMax + num, num) // 1
            totalMax = max(totalMax, curMax)  // 2
            curMin   = min(curMin + num, num) // 3
            totalMin = min(totalMin, curMin)  // 4
            total += num
        }
        
        return totalMax > 0 ? max(totalMax, total - totalMin) : totalMax
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// Subarray [3] has maximum sum 3.
    func test0() {
        let value = solution.maxSubarraySumCircular([1,-2,3,-2])
        XCTAssertEqual(value, 3)
    }
    
    /// Subarray [5,5] has maximum sum 5 + 5 = 10.
    func test1() {
        let value = solution.maxSubarraySumCircular([5,-3,5])
        XCTAssertEqual(value, 10)
    }
    
    /// Subarray [-2] has maximum sum -2.
    func test2() {
        let value = solution.maxSubarraySumCircular([-3,-2,-3])
        XCTAssertEqual(value, -2)
    }
}

Tests.defaultTestSuite.run()

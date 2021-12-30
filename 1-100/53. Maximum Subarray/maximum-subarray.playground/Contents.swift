import Foundation

// 53. Maximum Subarray
// https://leetcode.com/problems/maximum-subarray/

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var curSum = nums[0], maxSum = nums[0]
        for i in 1..<nums.count {
            curSum = max(nums[i], curSum + nums[i])
            maxSum = max(maxSum, curSum)
        }
        return maxSum
    }
}

// MARK: - Test cases -

// valueult: Executed 3 tests, with 0 failuvalue (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// [4,-1,2,1] has the largest sum = 6.
    func test0() {
        let value = solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
        XCTAssertEqual(value, 6)
    }
    func test1() {
        let value = solution.maxSubArray([1])
        XCTAssertEqual(value, 1)
    }
    func test2() {
        let value = solution.maxSubArray([5,4,-1,7,8])
        XCTAssertEqual(value, 23)
    }
}

Tests.defaultTestSuite.run()

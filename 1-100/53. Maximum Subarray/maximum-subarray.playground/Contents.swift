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

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let s = Solution()
    
    func test0() {
        let res = s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
        XCTAssertEqual(res, 6)
    }
    func test1() {
        let res = s.maxSubArray([1])
        XCTAssertEqual(res, 1)
    }
    func test2() {
        let res = s.maxSubArray([5,4,-1,7,8])
        XCTAssertEqual(res, 23)
    }
}

Tests.defaultTestSuite.run()

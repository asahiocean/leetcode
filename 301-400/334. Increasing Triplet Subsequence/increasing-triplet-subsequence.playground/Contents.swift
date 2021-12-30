import Foundation

// 334. Increasing Triplet Subsequence
// https://leetcode.com/problems/increasing-triplet-subsequence/

class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        
        guard nums.count >= 3 else { return false }
        
        var (small,mid) = (Int.max,Int.max)
        
        for n in nums {
            if n <= small { small = n } else
            if n <= mid { mid = n } else
            if n > mid { return true }
        }
        return false
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// Any triplet where i < j < k is valid.
    func test0() {
        let value = solution.increasingTriplet([1,2,3,4,5])
        XCTAssertEqual(value, true)
    }
    
    /// No triplet exists.
    func test1() {
        let value = solution.increasingTriplet([5,4,3,2,1])
        XCTAssertEqual(value, false)
    }
    
    /// The triplet (3, 4, 5) is valid because nums[3] == 0 < nums[4] == 4 < nums[5] == 6.
    func test2() {
        let value = solution.increasingTriplet([2,1,5,0,4,6])
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()

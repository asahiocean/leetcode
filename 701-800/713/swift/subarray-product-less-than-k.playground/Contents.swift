import Foundation

// 713. Subarray Product Less Than K
// https://leetcode.com/problems/subarray-product-less-than-k/

class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard k > 1 else { return 0 }
        let len = nums.count
        if len == 1 { return nums[0] }
        
        var pdt = 1, prv = 0, val = 0
        
        for n in 0..<len {
            pdt *= nums[n]
            while pdt >= k {
                pdt /= nums[prv]
                prv += 1
            }
            val += n - prv + 1
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /*
     The 8 subarrays that have product less than 100 are:
     [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6]
     Note that [10, 5, 2] is not included as the product of 100 is not strictly less than k.
    */
    func test0() {
        let value = solution.numSubarrayProductLessThanK([10,5,2,6], 100)
        XCTAssertEqual(value, 8)
    }
    func test1() {
        let value = solution.numSubarrayProductLessThanK([1,2,3], 0)
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

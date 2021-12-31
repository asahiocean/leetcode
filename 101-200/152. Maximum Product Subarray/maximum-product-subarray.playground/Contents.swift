import Foundation

// 152. Maximum Product Subarray
// https://leetcode.com/problems/maximum-product-subarray/

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        
        var value = nums[0]
        var fmin = value
        var fmax = value
        
        for i in 1..<nums.count {
            let num = nums[i]
            let vals = [fmax * num, fmin * num, num]
            if let max = vals.max() { fmax = max }
            if let min = vals.min() { fmin = min }
            value = max(value, fmax)
        }
        
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.021 (0.023) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// [2,3] has the largest product 6.
    func test0() {
        let value = solution.maxProduct([2,3,-2,4])
        XCTAssertEqual(value, 6)
    }
    
    /// The result cannot be 2, because [-2,-1] is not a subarray.
    func test1() {
        let value = solution.maxProduct([-2,0,-1])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 713. Subarray Product Less Than K
// https://leetcode.com/problems/subarray-product-less-than-k/

class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        
        guard k > 1 else { return 0 }
        if nums.count == 1 { return nums[0] }
        
        var value = 0
        var prod = 1
        var prev = 0
        
        for next in 0..<nums.count {
            prod *= nums[next]
            while prod >= k {
                prod /= nums[prev]
                prev += 1
            }
            value += next - prev + 1
        }
        
        return  value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
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

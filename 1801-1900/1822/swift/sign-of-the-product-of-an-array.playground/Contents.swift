import Foundation

// 1822. Sign of the Product of an Array
// https://leetcode.com/problems/sign-of-the-product-of-an-array/

class Solution {
    func arraySign(_ nums: [Int]) -> Int {
        var val = 1
        for x in nums.filter({$0 <= 0}) {
            val = (x < 0) ? -val : 0
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The product of all values in the array is 144, and signFunc(144) = 1
    func test0() {
        let value = solution.arraySign([-1,-2,-3,-4,3,2,1])
        XCTAssertEqual(value, 1)
    }
    
    // The product of all values in the array is 0, and signFunc(0) = 0
    func test1() {
        let value = solution.arraySign([1,5,0,2,-3])
        XCTAssertEqual(value, 0)
    }
    
    // The product of all values in the array is -1, and signFunc(-1) = -1
    func test2() {
        let value = solution.arraySign([-1,1,-1,1,-1])
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()

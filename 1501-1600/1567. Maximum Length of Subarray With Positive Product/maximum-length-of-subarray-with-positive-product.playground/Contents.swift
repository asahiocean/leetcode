import Foundation

// 1567. Maximum Length of Subarray With Positive Product
// https://leetcode.com/problems/maximum-length-of-subarray-with-positive-product/

class Solution {
    func getMaxLen(_ nums: [Int]) -> Int {
        
        var value = 0
        var temp: [Bool] = []
        
        func check() { if !temp.isEmpty { helper(&value, temp) } }
        
        for n in nums {
            if n == 0 {
                check()
                temp = []
            } else {
                temp.append(n > 0)
            }
        }
        check()
        return value
    }
    
    private func helper(_ value: inout Int, _ products: [Bool]) {
        
        var negIdxs: [Int] = [] // negative indices
        
        let count = products.count
        
        for i in 0..<count where !(products[i]) {
            negIdxs.append(i)
        }
        
        guard negIdxs.count % 2 == 1 else {
            value = max(value, count)
            return
        }
        
        if let first = negIdxs.first {
            value = max(value,
                        first > 0 ? first : 0, // left
                        max(0, count - (first + 1))) // right
        }
        if let last = negIdxs.last {
            value = max(value,
                        last, // left
                        last == (count - 1) ? 0 : (count - (last + 1))) // right
        }
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.021 (0.023) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// The array nums already has a positive product of 24.
    func test0() {
        let value = solution.getMaxLen([1,-2,-3,4])
        XCTAssertEqual(value, 4)
    }
    
    /// The longest subarray with positive product is [1,-2,-3] which has a product of 6.
    /// Notice that we cannot include 0 in the subarray since that'll make the product 0 which is not positive.
    func test1() {
        let value = solution.getMaxLen([0,1,-2,-3,-4])
        XCTAssertEqual(value, 3)
    }
    
    /// The longest subarray with positive product is [-1,-2] or [-2,-3].
    func test2() {
        let value = solution.getMaxLen([-1,-2,-3,0,1])
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 238. Product of Array Except Self
// https://leetcode.com/problems/product-of-array-except-self/

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var cnt = 0
        let val = nums.reduce(1) {
            if $1 == 0 { cnt += 1 }
            return $0 * ($1 == 0 ? 1 : $1)
        }
        if cnt > 1 { return [Int](repeating: 0, count: nums.count) }
        return nums.map { ($0 == 0 ? val : cnt == 1 ? 0 : val / $0) }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.productExceptSelf([1,2,3,4])
        XCTAssertEqual(value, [24,12,8,6])
    }
    
    func test1() {
        let value = solution.productExceptSelf([-1,1,0,-3,3])
        XCTAssertEqual(value, [0,0,9,0,0])
    }
}

Tests.defaultTestSuite.run()

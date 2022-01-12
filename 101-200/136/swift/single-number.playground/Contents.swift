import Foundation

// 136. Single Number
// https://leetcode.com/problems/single-number/

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = nums[0]
        for n in nums[1...] { result ^= n }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.017 (0.019) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.singleNumber([2,2,1])
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.singleNumber([4,1,2,1,2])
        XCTAssertEqual(value, 4)
    }
    
    func test2() {
        let value = solution.singleNumber([1])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()

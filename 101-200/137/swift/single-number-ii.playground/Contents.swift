import Foundation

// 137. Single Number II
// https://leetcode.com/problems/single-number-ii/

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var ones = 0, twos = 0
        for n in nums {
            ones = ones ^ n & ~twos
            twos = twos ^ n & ~ones
        }
        return ones
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.singleNumber([2,2,3,2])
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.singleNumber([0,1,0,1,0,1,99])
        XCTAssertEqual(value, 99)
    }
}

Tests.defaultTestSuite.run()

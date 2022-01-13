import Foundation

// 1. Two Sum
// https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int:Int] = [:]
        for (i, n) in nums.enumerated() {
            if let last = dict[target - n] {
                return [last, i]
            }
            dict[n] = i
        }
        return []
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.twoSum([2,7,11,15], 9)
        XCTAssertEqual(value, [0,1])
    }
    func test1() {
        let value = solution.twoSum([3,2,4], 6)
        XCTAssertEqual(value, [1,2])
    }
    func test2() {
        let value = solution.twoSum([3,3], 6)
        XCTAssertEqual(value, [0,1])
    }
}

Tests.defaultTestSuite.run()

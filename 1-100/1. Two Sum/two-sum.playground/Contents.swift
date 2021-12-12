import Foundation

// 1. Two Sum
// https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for (i, num) in nums.enumerated() {
            if let last = dict[target - num] {
                return [last, i]
            }
            dict[num] = i
        }
        return []
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.022 (0.024) seconds

import XCTest

class Tests: XCTestCase {
    
    private let s = Solution()
    
    func test0() {
        let res = s.twoSum([2,7,11,15], 9)
        XCTAssertEqual(res, [0,1])
    }
    func test1() {
        let res = s.twoSum([3,2,4], 6)
        XCTAssertEqual(res, [1,2])
    }
    func test2() {
        let res = s.twoSum([3,3], 6)
        XCTAssertEqual(res, [0,1])
    }
}

Tests.defaultTestSuite.run()

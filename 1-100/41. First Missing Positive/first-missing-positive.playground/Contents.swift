import Foundation

// 41. First Missing Positive
// https://leetcode.com/problems/first-missing-positive/

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let set = Set(nums)
        for i in 0..<nums.count where !set.contains(i+1) { return i + 1 }
        return nums.count + 1
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.firstMissingPositive([1,2,0])
        XCTAssertEqual(res, 3)
    }
    func test1() {
        let res = s.firstMissingPositive([3,4,-1,1])
        XCTAssertEqual(res, 2)
    }
    func test2() {
        let res = s.firstMissingPositive([7,8,9,11,12])
        XCTAssertEqual(res, 1)
    }
}

Tests.defaultTestSuite.run()

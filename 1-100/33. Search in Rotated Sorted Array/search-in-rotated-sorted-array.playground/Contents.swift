import Foundation

// 33. Search in Rotated Sorted Array
// https://leetcode.com/problems/search-in-rotated-sorted-array/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1, m = 0
        
        while l <= r {
            m = (r - l) / 2 + l
            let nm = nums[m], nl = nums[l], t = target
            if nm == t { return m }
            if nm >= nl {
                nm > t && t >= nl ? (r = m - 1) : (l = m + 1)
            } else {
                nm < t && t <= nums[r] ? (l = m + 1) : (r = m - 1)
            }
        }
        return -1
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.010) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.search([4,5,6,7,0,1,2], 0)
        XCTAssertEqual(res, 4)
    }
    func test1() {
        let res = s.search([4,5,6,7,0,1,2], 3)
        XCTAssertEqual(res, -1)
    }
    func test2() {
        let res = s.search([1], 0)
        XCTAssertEqual(res, -1)
    }
}

Tests.defaultTestSuite.run()

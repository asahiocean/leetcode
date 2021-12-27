import Foundation

// 33. Search in Rotated Sorted Array
// https://leetcode.com/problems/search-in-rotated-sorted-array/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1, mid = 0
        
        while left <= right {
            mid = (right - left) / 2 + left
            let nm = nums[mid], nl = nums[left], t = target
            if nm == t { return mid }
            if nm >= nl {
                nm > t && t >= nl ? (right = mid - 1) : (left = mid + 1)
            } else {
                nm < t && t <= nums[right] ? (left = mid + 1) : (right = mid - 1)
            }
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let res = solution.search([4,5,6,7,0,1,2], 0)
        XCTAssertEqual(res, 4)
    }
    func test1() {
        let res = solution.search([4,5,6,7,0,1,2], 3)
        XCTAssertEqual(res, -1)
    }
    func test2() {
        let res = solution.search([1], 0)
        XCTAssertEqual(res, -1)
    }
}

Tests.defaultTestSuite.run()

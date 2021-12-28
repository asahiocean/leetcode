import Foundation

// 34. Find First and Last Position of Element in Sorted Array
// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else { return [-1, -1] }
        
        var left = 0, right = nums.count - 1
        var result = [-1,-1]
        
        while left < right {
            let mid = left + (right - left) / 2
            nums[mid] < target ? (left = mid + 1) : (right = mid)
        }
        
        guard nums[left] == target else { return result }
        result[0] = left
        
        right = nums.count - 1
        while left < right {
            let mid = left + (right - left) / 2 + 1
            target < nums[mid] ? (right = mid - 1) : (left = mid)
        }
        result[1] = left
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.011 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let res = solution.searchRange([5,7,7,8,8,10], 8)
        XCTAssertEqual(res, [3,4])
    }
    func test1() {
        let res = solution.searchRange([5,7,7,8,8,10], 6)
        XCTAssertEqual(res, [-1,-1])
    }
    func test2() {
        let res = solution.searchRange([], 0)
        XCTAssertEqual(res, [-1,-1])
    }
}

Tests.defaultTestSuite.run()

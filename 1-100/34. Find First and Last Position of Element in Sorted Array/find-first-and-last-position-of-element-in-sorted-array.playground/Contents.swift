import Foundation

// 34. Find First and Last Position of Element in Sorted Array
// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else { return [-1, -1] }
        
        var lhs = 0, rhs = nums.count - 1
        var result = [-1,-1]
        
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) / 2
            nums[mid] < target ? (lhs = mid + 1) : (rhs = mid)
        }
        
        guard nums[lhs] == target else { return result }
        result[0] = lhs
        
        rhs = nums.count - 1
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) / 2 + 1
            target < nums[mid] ? (rhs = mid - 1) : (lhs = mid)
        }
        result[1] = lhs
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.011 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.searchRange([5,7,7,8,8,10], 8)
        XCTAssertEqual(value, [3,4])
    }
    
    func test1() {
        let value = solution.searchRange([5,7,7,8,8,10], 6)
        XCTAssertEqual(value, [-1,-1])
    }
    
    func test2() {
        let value = solution.searchRange([], 0)
        XCTAssertEqual(value, [-1,-1])
    }
}

Tests.defaultTestSuite.run()

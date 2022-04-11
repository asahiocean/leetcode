import Foundation

// 153. Find Minimum in Rotated Sorted Array
// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        
        var val = Int.max
        var lhs = 0, rhs = nums.count - 1
        
        while lhs <= rhs {
            let mid = (rhs - lhs) / 2 + lhs
            if nums[mid] >= nums[lhs] {
                val = min(val, nums[lhs])
                lhs = mid + 1
            } else {
                val = min(val, nums[mid])
                rhs = mid - 1
            }
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The original array was [1,2,3,4,5] rotated 3 times.
    func test0() {
        let value = solution.findMin([3,4,5,1,2])
        XCTAssertEqual(value, 1)
    }
    
    // The original array was [0,1,2,4,5,6,7] and it was rotated 4 times.
    func test1() {
        let value = solution.findMin([4,5,6,7,0,1,2])
        XCTAssertEqual(value, 0)
    }
    
    // The original array was [11,13,15,17] and it was rotated 4 times.
    func test2() {
        let value = solution.findMin([11,13,15,17])
        XCTAssertEqual(value, 11)
    }
}

Tests.defaultTestSuite.run()

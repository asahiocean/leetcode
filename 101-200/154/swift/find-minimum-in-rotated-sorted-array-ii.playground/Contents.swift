import Foundation

// 154. Find Minimum in Rotated Sorted Array II
// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var val = Int.max, lhs = 0, rhs = nums.count - 1
        
        while lhs + 1 < rhs {
            let mid = (rhs - lhs) / 2 + lhs
            switch true {
            case nums[mid] > nums[lhs]:
                val = min(nums[lhs], val)
                lhs = mid + 1
            case nums[mid] < nums[lhs]:
                val = min(nums[mid], val)
                rhs = mid - 1
            default:
                lhs += 1
            }
        }
        return min(val, nums[lhs], nums[rhs])
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findMin([1,3,5])
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.findMin([2,2,2,0,1])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()

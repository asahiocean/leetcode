import Foundation

// 81. Search in Rotated Sorted Array II
// https://leetcode.com/problems/search-in-rotated-sorted-array-ii/

class Solution {
    func search(_ nums: [Int], _ t: Int) -> Bool {
        let len = nums.count
        guard len > 0 else { return false }
        var lhs = 0, rhs = len - 1
        
        while lhs < rhs {
            let mid = (lhs + rhs) / 2
            guard !(nums[mid] == t) else { return true }
            if nums[lhs] == nums[mid] {
                lhs += 1
            } else {
                let num = (L: nums[lhs], M: nums[mid], R: nums[rhs])
                num.L < num.M ?
                t < num.M && t >= num.L ? (rhs = mid - 1) : (lhs = mid + 1) :
                t > num.M && t <= num.R ? (lhs = mid + 1) : (rhs = mid - 1)
            }
        }
        return nums[lhs] == t
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.search([2,5,6,0,0,1,2],0)
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.search([2,5,6,0,0,1,2],3)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()

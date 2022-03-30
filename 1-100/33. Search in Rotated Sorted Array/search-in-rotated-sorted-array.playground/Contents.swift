import Foundation

// 33. Search in Rotated Sorted Array
// https://leetcode.com/problems/search-in-rotated-sorted-array/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var lhs = 0, mid = 0, rhs = nums.count - 1
        
        while lhs <= rhs {
            mid = (rhs - lhs) / 2 + lhs
            let numM = nums[mid], numL = nums[lhs], tgt = target
            if numM == tgt { return mid }
            if numM >= numL {
                numM > tgt && tgt >= numL ? (rhs = mid - 1) : (lhs = mid + 1)
            } else {
                numM < tgt && tgt <= nums[rhs] ? (lhs = mid + 1) : (rhs = mid - 1)
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

import Foundation

// 35. Search Insert Position
// https://leetcode.com/problems/search-insert-position/

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        var val = 0, idx = (nums.count - 1)
        
        while val <= idx {
            let num = val + ((idx - val) / 2)
            if nums[num] < target {
                val = num + 1
            } else if nums[num] > target {
                idx = num - 1
            } else {
                return num
            }
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failuvalue (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    private let nums = [1,3,5,6]
    
    func test0() {
        let value = solution.searchInsert(nums, 5)
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.searchInsert(nums, 2)
        XCTAssertEqual(value, 1)
    }
    
    func test2() {
        let value = solution.searchInsert(nums, 7)
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()

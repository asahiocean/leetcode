import Foundation

// 80. Remove Duplicates from Sorted Array II
// https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let len = nums.count
        guard len > 2 else { return len }
        
        var k = 1
        
        for n in 2..<len where nums[k] != nums[k-1] || nums[k] != nums[n] {
            k += 1
            nums[k] = nums[n]
        }
        return k + 1
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
    // It does not matter what you leave beyond the returned k (hence they are underscores).
    func test0() {
        var nums = [1,1,1,2,2,3]
        let value = solution.removeDuplicates(&nums)
        XCTAssertEqual(value, [1,1,2,2,3].count)
        XCTAssertEqual(value, 5)
    }
    
    // Your function should return k = 7, with the first seven elements of nums being 0, 0, 1, 1, 2, 3 and 3 respectively.
    // It does not matter what you leave beyond the returned k (hence they are underscores).
    func test1() {
        var nums = [0,0,1,1,1,1,2,3,3]
        let value = solution.removeDuplicates(&nums)
        XCTAssertEqual(value, [0,0,1,1,2,3,3].count)
        XCTAssertEqual(value, 7)
    }
}

Tests.defaultTestSuite.run()

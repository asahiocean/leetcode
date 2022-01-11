import Foundation

// 704. Binary Search
// https://leetcode.com/problems/binary-search/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target { return mid }
            nums[mid] > target ? (right = mid - 1) : (left = mid + 1)
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 9 exists in nums and its index is 4
    func test0() {
        let value = solution.search([-1,0,3,5,9,12], 9)
        XCTAssertEqual(value, 4)
    }
    
    // 2 does not exist in nums so return -1
    func test1() {
        let value = solution.search([-1,0,3,5,9,12], 2)
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()

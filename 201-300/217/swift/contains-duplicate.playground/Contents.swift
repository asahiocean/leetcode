import Foundation

// 217. Contains Duplicate
// https://leetcode.com/problems/contains-duplicate/

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return nums.count > Set(nums).count
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.containsDuplicate([1,2,3,1])
        XCTAssertEqual(value, true)
    }
    func test1() {
        let value = solution.containsDuplicate([1,2,3,4])
        XCTAssertEqual(value, false)
    }
    func test2() {
        let value = solution.containsDuplicate([1,1,1,3,3,4,3,2,4,2])
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()

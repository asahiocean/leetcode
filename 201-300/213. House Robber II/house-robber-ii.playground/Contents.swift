import Foundation

// 213. House Robber II
// https://leetcode.com/problems/house-robber-ii/

class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count != 0 else { return 0 }
        guard nums.count != 1 else { return nums[0] }
        return max(helper(nums, 0, nums.count - 2), helper(nums, 1, nums.count - 1))
    }
    
    private func helper(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        if start > end { return 0 }
        
        var prev = 0, curr = 0, value = 0
        
        for i in start...end {
            value = max(prev + nums[i], curr)
            (curr, prev) = (value, curr)
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.011 (0.013) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.
    func test0() {
        let value = solution.rob([2,3,2])
        XCTAssertEqual(value, 3)
    }
    
    /// Rob house 1 (money = 1) and then rob house 3 (money = 3).
    /// Total amount you can rob = 1 + 3 = 4.
    func test1() {
        let value = solution.rob([1,2,3,1])
        XCTAssertEqual(value, 4)
    }
    
    func test2() {
        let value = solution.rob([1,2,3])
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()

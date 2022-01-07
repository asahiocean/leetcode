import Foundation

// 213. House Robber II
// https://leetcode.com/problems/house-robber-ii/

class Solution {
    func rob(_ nums: [Int]) -> Int {
        let cnt = nums.count
        guard cnt != 1 else { return cnt != 0 ? nums[0] : 0 }
        return max(helper(nums, 0, cnt - 2), helper(nums, 1, cnt - 1))
    }
    
    private func helper(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        var pre = 0, cur = 0, val = 0
        if start > end { return val }
        for i in start...end {
            val = max(pre + nums[i], cur)
            (cur, pre) = (val, cur)
        }
        return val
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

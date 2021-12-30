import Foundation

// 55. Jump Game
// https://leetcode.com/problems/jump-game/

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var indexMax = nums[0]
        for (i, v) in nums.enumerated() {
            if i > indexMax{ return false }
            indexMax = max(indexMax, i + v)
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// Jump 1 step from index 0 to 1, then 3 steps to the last index.
    func test0() {
        let value = solution.canJump([2,3,1,1,4])
        XCTAssertEqual(value, true)
    }
    
    /// You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
    func test1() {
        let value = solution.canJump([3,2,1,0,4])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()

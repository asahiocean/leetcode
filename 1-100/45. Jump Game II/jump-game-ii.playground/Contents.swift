import Foundation

// 45. Jump Game II
// https://leetcode.com/problems/jump-game-ii/

class Solution {
    func jump(_ nums: [Int]) -> Int {
        let count = nums.count
        var step = 0, end = 0, maxPos = 0
        for i in 0..<(count - 1) where 1 <= count && count <= Int(10e4) {
            maxPos = max(maxPos, i + nums[i])
            if i == end { end = maxPos; step += 1 }
        }
        return step
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
    func test0() {
        let value = solution.jump([2,3,1,1,4])
        XCTAssertEqual(value, 2)
    }
    func test1() {
        let value = solution.jump([2,3,0,1,4])
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()

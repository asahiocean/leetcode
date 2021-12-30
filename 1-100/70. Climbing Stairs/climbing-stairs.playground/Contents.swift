import Foundation

// 70. Climbing Stairs
// https://leetcode.com/problems/climbing-stairs/

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var zero = 1, one = 1, step = 2
        while step <= n {
            let temp = zero + one
            zero = one
            one = temp
            step += 1
        }
        return one
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// There are two ways to climb to the top.
    /// 1. 1 step + 1 step
    /// 2. 2 steps
    func test0() {
        let value = solution.climbStairs(2)
        XCTAssertEqual(value, 2)
    }
    
    /// There are three ways to climb to the top.
    /// 1. 1 step + 1 step + 1 step
    /// 2. 1 step + 2 steps
    /// 3. 2 steps + 1 step
    func test1() {
        let value = solution.climbStairs(3)
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()

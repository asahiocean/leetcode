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
    
    func test0() {
        XCTAssertEqual(solution.climbStairs(2), 2)
    }
    func test1() {
        XCTAssertEqual(solution.climbStairs(3), 3)
    }
}

Tests.defaultTestSuite.run()

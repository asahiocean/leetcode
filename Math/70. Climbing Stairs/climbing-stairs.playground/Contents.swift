import Foundation

// https://leetcode.com/problems/climbing-stairs/
// Discuss: https://vk.cc/c3Okf2

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var zero = 1, one = 1, step = 2
        while step <= n {
            let t = zero + one
            zero = one
            one = t
            step += 1
        }
        return one
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        XCTAssertEqual(s.climbStairs(2), 2)
    }
    func test1() {
        XCTAssertEqual(s.climbStairs(3), 3)
    }
}

Tests.defaultTestSuite.run()

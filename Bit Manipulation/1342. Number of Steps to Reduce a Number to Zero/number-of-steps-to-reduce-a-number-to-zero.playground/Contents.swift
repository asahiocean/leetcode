import Foundation

// 1342. Number of Steps to Reduce a Number to Zero
// https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/

class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var t = num, c = 0
        while t != 0 {
            if t % 2 == 0 {
                let n = t / 2
                c += 1
                t = n
            } else {
                let n = t - 1
                c += 1
                t = n
            }
        }
        return c
    }
}

// MARK: - Test Cases -

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.006) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        XCTAssertEqual(s.numberOfSteps(14), 6)
    }
    func test1() {
        XCTAssertEqual(s.numberOfSteps(8), 4)
    }
    func test2() {
        XCTAssertEqual(s.numberOfSteps(123), 12)
    }
}

Tests.defaultTestSuite.run()

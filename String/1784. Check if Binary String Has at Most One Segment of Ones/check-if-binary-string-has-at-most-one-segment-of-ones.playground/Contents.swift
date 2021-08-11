import Foundation

// https://leetcode.com/problems/check-if-binary-string-has-at-most-one-segment-of-ones
// Discuss: https://vk.cc/c3Gct9

class Solution {
    func checkOnesSegment(_ s: String) -> Bool {
        return !s.contains("01")
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let res = s.checkOnesSegment("1001")
        XCTAssertEqual(res, false)
    }
    func test2() {
        let res = s.checkOnesSegment("110")
        XCTAssertEqual(res, true)
    }
}

Tests.defaultTestSuite.run()

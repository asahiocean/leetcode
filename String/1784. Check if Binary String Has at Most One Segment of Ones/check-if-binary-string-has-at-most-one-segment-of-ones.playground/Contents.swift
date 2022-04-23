import Foundation

// 1784. Check if Binary String Has at Most One Segment of Ones
// https://leetcode.com/problems/check-if-binary-string-has-at-most-one-segment-of-ones/

class Solution {
    func checkOnesSegment(_ s: String) -> Bool {
        return !s.contains("01")
    }
}

// MARK: - Test Cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let res = solution.checkOnesSegment("1001")
        XCTAssertEqual(res, false)
    }
    
    func test1() {
        let res = solution.checkOnesSegment("110")
        XCTAssertEqual(res, true)
    }
}

Tests.defaultTestSuite.run()

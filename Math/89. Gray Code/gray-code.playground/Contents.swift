import Foundation

// 89. Gray Code
// https://leetcode.com/problems/gray-code/

class Solution {
    func grayCode(_ n: Int) -> [Int] {
        var codes = [0]
        for k in 0..<n { codes += codes.reversed().map { $0 | 1 << k } }
        return codes
    }
}

import XCTest

//     Executed 2 tests, with 0 failures (0 unexpected) in 0.013 (0.015) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.grayCode(2)
        XCTAssertEqual(res, [0,1,3,2])
    }
    func test1() {
        let res = s.grayCode(1)
        XCTAssertEqual(res, [0,1])
    }
}

Tests.defaultTestSuite.run()

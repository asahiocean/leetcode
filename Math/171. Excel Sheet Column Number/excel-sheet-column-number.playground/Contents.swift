import Foundation

// 171. Excel Sheet Column Number
// https://leetcode.com/problems/excel-sheet-column-number/

class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        return columnTitle.unicodeScalars.reduce(0,{ $0 * 26 + Int($1.value) - 64})
    }
}

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.titleToNumber("A")
        XCTAssertEqual(res, 1)
    }
    func test1() {
        let res = s.titleToNumber("AB")
        XCTAssertEqual(res, 28)
    }
    func test2() {
        let res = s.titleToNumber("ZY")
        XCTAssertEqual(res, 701)
    }
    func test3() {
        let res = s.titleToNumber("FXSHRXW")
        XCTAssertEqual(res, 2147483647)
    }
}

Tests.defaultTestSuite.run()

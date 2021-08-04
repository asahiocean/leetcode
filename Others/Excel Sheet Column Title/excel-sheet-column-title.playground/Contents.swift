import Foundation

// 168. Excel Sheet Column Title
// https://leetcode.com/problems/excel-sheet-column-title/

class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        guard columnNumber > 0 else { return "" }
        var string = ""
        var num = columnNumber
        let a = Int("A".unicodeScalars.first!.value)
        while num > 0 {
            num -= 1
            let char = UnicodeScalar(a + num % 26)!
            string = String(char) + string
            num = num / 26
        }
        return string
    }
}


import XCTest

//     Executed 4 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        XCTAssertEqual(s.convertToTitle(1), "A")
    }
    func test1() {
        XCTAssertEqual(s.convertToTitle(28),"AB")
    }
    func test2() {
        XCTAssertEqual(s.convertToTitle(701),"ZY")
    }
    func test3() {
        XCTAssertEqual(s.convertToTitle(2147483647),"FXSHRXW")
    }
}

Tests.defaultTestSuite.run()

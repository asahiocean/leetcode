import Foundation

// 168. Excel Sheet Column Title
// https://leetcode.com/problems/excel-sheet-column-title/

class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        
        var string = ""
        guard columnNumber > 0 else { return string }
        
        var num = columnNumber
        
        while num > 0, let unicode = "A".unicodeScalars.first {
            num -= 1
            let char = UnicodeScalar(Int(unicode.value) + (num % 26))!
            string = String(char) + string
            num = num / 26
        }
        return string
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.convertToTitle(1)
        XCTAssertEqual(value, "A")
    }
    func test1() {
        let value = solution.convertToTitle(28)
        XCTAssertEqual(value, "AB")
    }
    func test2() {
        let value = solution.convertToTitle(701)
        XCTAssertEqual(value, "ZY")
    }
    func test3() {
        let value = solution.convertToTitle(2147483647)
        XCTAssertEqual(value, "FXSHRXW")
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 171. Excel Sheet Column Number
// https://leetcode.com/problems/excel-sheet-column-number/

class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        return columnTitle.unicodeScalars.reduce(0, { $0 * 26 + Int($1.value) - 64})
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.titleToNumber("A")
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.titleToNumber("AB")
        XCTAssertEqual(value, 28)
    }
    
    func test2() {
        let value = solution.titleToNumber("ZY")
        XCTAssertEqual(value, 701)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 6. Zigzag Conversion
// https://leetcode.com/problems/zigzag-conversion/

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        var lines = [[Character]](repeating: [], count: numRows)
        var i = 0, flag = false
        s.forEach({
            lines[i].append($0)
            if flag {
                i -= 1
                if i == -1 { flag = false; i += 2 }
            } else {
                i += 1
                if i == numRows { flag = true; i -= 2 }
            }
        })
        return lines.map { String($0) }.joined()
    }
}

// MARK: - Test Cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let s = Solution()
    
    func test0() {
        let value = s.convert("PAYPALISHIRING", 3)
        XCTAssertEqual(value, "PAHNAPLSIIGYIR")
    }
    
    func test1() {
        let value = s.convert("PAYPALISHIRING", 4)
        XCTAssertEqual(value, "PINALSIGYAHRPI")
    }
    
    func test2() {
        let value = s.convert("A", 1)
        XCTAssertEqual(value, "A")
    }
}

Tests.defaultTestSuite.run()

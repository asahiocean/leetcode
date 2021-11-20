import Foundation

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

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    
    func testExample1() {
        XCTAssertEqual(s.convert("PAYPALISHIRING", 3), "PAHNAPLSIIGYIR") // success
    }
    
    func testExample2() {
        XCTAssertEqual(s.convert("PAYPALISHIRING", 4), "PINALSIGYAHRPI") // success
    }
    
    func testExample3() {
        XCTAssertEqual(s.convert("A", 1), "A") // success
    }
}

Tests.defaultTestSuite.run()

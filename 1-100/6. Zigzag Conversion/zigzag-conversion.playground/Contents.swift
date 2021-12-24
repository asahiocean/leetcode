import Foundation

// 6. Zigzag Conversion
// https://leetcode.com/problems/zigzag-conversion/

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        
        var lines = [[Character]](repeating: [], count: numRows)
        var index: Int = 0
        var flag: Bool = false
        
        for ch in s {
            lines[index].append(ch)
            if flag {
                index -= 1
                if index == -1 {
                    flag = false
                    index += 2
                }
            } else {
                index += 1
                if index == numRows {
                    flag = true
                    index -= 2
                }
            }
        }
        return lines.map { String($0) }.joined()
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.convert("PAYPALISHIRING", 3)
        XCTAssertEqual(value, "PAHNAPLSIIGYIR")
    }
    
    func test1() {
        let value = solution.convert("PAYPALISHIRING", 4)
        XCTAssertEqual(value, "PINALSIGYAHRPI")
    }
    
    func test2() {
        let value = solution.convert("A", 1)
        XCTAssertEqual(value, "A")
    }
}

Tests.defaultTestSuite.run()

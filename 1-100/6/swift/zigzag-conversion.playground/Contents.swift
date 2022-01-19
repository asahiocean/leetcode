import Foundation

// 6. Zigzag Conversion
// https://leetcode.com/problems/zigzag-conversion/

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard s.count > 1 && numRows > 1 else { return s }
        
        var lines = [[Character]](repeating: [], count: numRows)
        var idx = 0
        var flag = false
        
        for ch in s {
            lines[idx].append(ch)
            idx += flag ? -1 : 1
            guard idx == -1 || idx == numRows else { continue }
            idx += flag ? 2 : -2
            flag.toggle()
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
    
    // P     I    N
    // A   L S  I G
    // Y A   H R
    // P     I
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

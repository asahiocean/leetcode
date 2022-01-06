import Foundation

// 119. Pascal's Triangle II
// https://leetcode.com/problems/pascals-triangle-ii/

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        let index = rowIndex + 1
        guard index > 2 else { return [Int](repeating: 1, count: index) }
        var lastRow = [Int](repeating: 1, count: 2)
        for i in 3...index {
            var row = [Int](repeating: 1, count: i)
            for n in 1...i/2 {
                row[n] = lastRow[n-1] + lastRow[n]
                row[i - n - 1] = row[n]
            }
            lastRow = row
        }
        return lastRow
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.018 (0.020) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.getRow(3)
        XCTAssertEqual(value, [1,3,3,1])
    }
    
    func test1() {
        let value = solution.getRow(0)
        XCTAssertEqual(value, [1])
    }
    
    func test2() {
        let value = solution.getRow(1)
        XCTAssertEqual(value, [1,1])
    }
}

Tests.defaultTestSuite.run()

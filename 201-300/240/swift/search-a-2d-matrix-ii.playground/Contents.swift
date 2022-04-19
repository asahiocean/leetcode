import Foundation

// 240. Search a 2D Matrix II
// https://leetcode.com/problems/search-a-2d-matrix-ii/

class Solution {
    func searchMatrix(_ m: [[Int]], _ t: Int) -> Bool {
        guard !m.isEmpty else { return false }
        var row = 0, col = m[0].count - 1
        while row < m.count && col >= 0 {
            let val = m[row][col]
            guard val != t else { return true }
            val < t ? (row += 1) : (col -= 1)
        }
        return false
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.searchMatrix([[1,4,7,11,15],
                                           [2,5,8,12,19],
                                           [3,6,9,16,22],
                                           [10,13,14,17,24],
                                           [18,21,23,26,30]], 5)
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.searchMatrix([[1,4,7,11,15],
                                           [2,5,8,12,19],
                                           [3,6,9,16,22],
                                           [10,13,14,17,24],
                                           [18,21,23,26,30]], 20)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()

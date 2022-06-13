import Foundation

// 120. Triangle
// https://leetcode.com/problems/triangle/

class Solution {
    func minimumTotal(_ t: [[Int]]) -> Int {
        guard !t.isEmpty else { return 0 }
        var arr = t.last!
        for i in stride(from: t.count - 2, through: 0, by: -1) {
            for j in 0...i {
                arr[j] = min(arr[j], arr[j+1]) + t[i][j]
            }
        }
        return arr[0]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private typealias sol = Solution
    
    // The triangle looks like:
    //    2
    //   3 4
    //  6 5 7
    // 4 1 8 3
    // The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).
    func test0() {
        let value = sol().minimumTotal([[2],
                                        [3,4],
                                        [6,5,7],
                                        [4,1,8,3]])
        XCTAssertEqual(value, 11)
    }
    
    func test1() {
        let value = sol().minimumTotal([[-10]])
        XCTAssertEqual(value, -10)
    }
}

Tests.defaultTestSuite.run()

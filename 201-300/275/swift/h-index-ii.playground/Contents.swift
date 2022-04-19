import Foundation

// 275. H-Index II
// https://leetcode.com/problems/h-index-ii/

class Solution {
    func hIndex(_ c: [Int]) -> Int {
        var lhs = 0, rhs = c.count
        while lhs < rhs {
            let mid = lhs + (rhs - lhs + 1) >> 1
            c[c.count - mid] >= mid ? (lhs = mid) : (rhs = mid - 1)
        }
        return lhs
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // [0,1,3,5,6] means the researcher has 5 papers in total and each
    // of them had received 0, 1, 3, 5, 6 citations respectively.
    // Since the researcher has 3 papers with at least 3 citations each and
    // the remaining two with no more than 3 citations each, their h-index is 3.
    func test0() {
        let value = solution.hIndex([0,1,3,5,6])
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.hIndex([1,2,100])
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()

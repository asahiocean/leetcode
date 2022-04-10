import Foundation

// 33. Search in Rotated Sorted Array
// https://leetcode.com/problems/search-in-rotated-sorted-array/

class Solution {
    func search(_ n: [Int], _ t: Int) -> Int {
        var lhs = 0, rhs = n.count - 1
        while lhs <= rhs {
            let mid = (rhs - lhs) / 2 + lhs
            let val = (l: n[lhs], m: n[mid], r: n[rhs])
            if val.m == t { return mid }
            func setR() { rhs = mid - 1 }
            func setL() { lhs = mid + 1 }
            if val.m >= val.l {
                val.m > t && t >= val.l ? setR() : setL()
            } else {
                val.m < t && t <= val.r ? setL() : setR()
            }
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let res = solution.search([4,5,6,7,0,1,2], 0)
        XCTAssertEqual(res, 4)
    }
    
    func test1() {
        let res = solution.search([4,5,6,7,0,1,2], 3)
        XCTAssertEqual(res, -1)
    }
    
    func test2() {
        let res = solution.search([1], 0)
        XCTAssertEqual(res, -1)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// https://leetcode.com/problems/longest-harmonious-subsequence

class Solution {
    func findLHS(_ nums: [Int]) -> Int {
        let map = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        var res = 0
        for k in map.keys where map[k+1] != nil {
            res = max(res, map[k]! + map[k + 1]!)
        }
        return res
    }
}

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.findLHS([1,3,2,2,5,2,3,7]), 5)
    }
    func test2() {
        XCTAssertEqual(s.findLHS([1,2,3,4]), 2)
    }
    func test3() {
        XCTAssertEqual(s.findLHS([1,1,1,1]), 0)
    }
}

Tests.defaultTestSuite.run()

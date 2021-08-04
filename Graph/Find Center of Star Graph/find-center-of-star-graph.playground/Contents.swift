import Foundation

// 1791. Find Center of Star Graph
// https://leetcode.com/problems/find-center-of-star-graph/

class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        let null = edges[0][0]
        return (null == edges[1][0] || null == edges[1][1]) ? null : edges[0][1]
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.findCenter([[1,2],[2,3],[4,2]])
        XCTAssertEqual(res, 2)
    }
    func test1() {
        let res = s.findCenter([[1,2],[5,1],[1,3],[1,4]])
        XCTAssertEqual(res, 1)
    }
}

Tests.defaultTestSuite.run()

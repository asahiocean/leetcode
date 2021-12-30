import Foundation

// 1901. Find a Peak Element II
// https://leetcode.com/problems/find-a-peak-element-ii/

class Solution {
    func findPeakGrid(_ mat: [[Int]]) -> [Int] {
        let l = mat.count, n = mat[0].count
        var a = 0, b = 0
        while true {
            let x = mat[a][b], mi = mat[a]
            if a + 1 < l && mat[a+1][b] > x { a += 1; do { continue } }
            if a - 1 >= 0 && mat[a-1][b] > x { a -= 1; do { continue } }
            if b + 1 < n && mi[b+1] > x { b += 1; do { continue } }
            if b - 1 >= 0 && mi[b-1] > x { b -= 1; do { continue } }
            break
        }
        return [a,b]
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.findPeakGrid([[1,4],[3,2]])
        XCTAssertEqual(res, [1,0])
    }
    func test1() {
        let res = s.findPeakGrid([[10,20,15],[21,30,14],[7,16,32]])
        XCTAssertEqual(res, [1,1])
    }
}

Tests.defaultTestSuite.run()

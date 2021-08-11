import Foundation

// Solution at July 6, 2021
// Runtime: 4 ms, faster than 100.00% of Swift

// https://leetcode.com/problems/valid-boomerang
// Discuss: https://vk.cc/c3EhFm

class Solution {
    func isBoomerang(_ points: [[Int]]) -> Bool {
        guard Set(points).count >= 3 else { return false }
        
        let points = points.map { [Double($0[0] + 1), Double($0[1] + 1)] }
        func f(_ a: Int,_ b: Int,_ c: Int,_ d: Int) -> Double {abs(points[a][b] - points[c][d])}
        
        let _0010 = f(0,0,1,0),
            _0111 = f(0,1,1,1),
            _0020 = f(0,0,2,0),
            _0121 = f(0,1,2,1),
            _1020 = f(1,0,2,0),
            _1121 = f(1,1,2,1)
        
        let r1 = _0010 / _0111,
            r2 = _0020 / _0121,
            r3 = _1020 / _1121
        
        return !(r1 == r2 && r1 == r3)
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let res = s.isBoomerang([[1,1],[2,3],[3,2]])
        XCTAssertEqual(res, true)
    }
    func test2() {
        let res = s.isBoomerang([[1,1],[2,2],[3,3]])
        XCTAssertEqual(res, false)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 1037. Valid Boomerang
// https://leetcode.com/problems/valid-boomerang/

class Solution {
    func isBoomerang(_ points: [[Int]]) -> Bool {
        guard Set(points).count >= 3 else { return false }
        
        let pnts = points.map { [Double($0[0] + 1), Double($0[1] + 1)] }
        
        let val: (Int,Int,Int,Int) -> Double = { abs(pnts[$0][$1] - pnts[$2][$3]) }
        
        let val1 = val(0,0,1,0) / val(0,1,1,1),
            val2 = val(0,0,2,0) / val(0,1,2,1),
            val3 = val(1,0,2,0) / val(1,1,2,1)
        
        return !(val1 == val2 && val1 == val3)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let res = solution.isBoomerang([[1,1],[2,3],[3,2]])
        XCTAssertEqual(res, true)
    }
    
    func test1() {
        let res = solution.isBoomerang([[1,1],[2,2],[3,3]])
        XCTAssertEqual(res, false)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 498. Diagonal Traverse
// https://leetcode.com/problems/diagonal-traverse

class Solution {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        let c = mat.count, n = mat.first?.count ?? 0
        guard c > 0 && n > 0 else { return [] }
        var res = [Int](), fromTop = false
        
        for sum in 0...(c + n - 2) {
            let arr = Array(max(sum - n + 1, 0)...min(c - 1, sum))
            for i in fromTop ? arr : arr.reversed() { res.append(mat[i][sum-i]) }
            fromTop = !(fromTop)
        }
        return res
    }
}

import XCTest

// MARK: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let res = s.findDiagonalOrder([[1,2,3],[4,5,6],[7,8,9]])
        XCTAssertEqual(res, [1,2,4,7,5,3,6,8,9])
    }
    func test2() {
        let res = s.findDiagonalOrder([[1,2],[3,4]])
        XCTAssertEqual(res, [1,2,3,4])
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 1337. The K Weakest Rows in a Matrix
// https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/

class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        guard let m = mat.first?.count else { return [] }
        var dict: [Int:Int] = [:]
        for i in mat.indices {
            for j in 0 ..< m {
                dict[i, default: 0] += mat[i][j]
            }
        }
        let list = dict.sorted{$0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1}.map{$0.0}
        return Array(list[0 ..< k])
    }
}

// MARK: - Test Cases -

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.kWeakestRows([[1,1,0,0,0],[1,1,1,1,0],[1,0,0,0,0],[1,1,0,0,0],[1,1,1,1,1]], 3)
        XCTAssertEqual(res, [2,0,3])
    }
    func test1() {
        let res = s.kWeakestRows([[1,0,0,0],[1,1,1,1],[1,0,0,0],[1,0,0,0]], 2)
        XCTAssertEqual(res, [0,2])
    }
}

Tests.defaultTestSuite.run()

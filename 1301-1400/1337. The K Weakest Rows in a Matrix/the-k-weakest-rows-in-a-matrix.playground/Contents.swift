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

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.kWeakestRows([[1,1,0,0,0],
                                           [1,1,1,1,0],
                                           [1,0,0,0,0],
                                           [1,1,0,0,0],
                                           [1,1,1,1,1]], 3)
        XCTAssertEqual(value, [2,0,3])
    }
    func test1() {
        let value = solution.kWeakestRows([[1,0,0,0],
                                           [1,1,1,1],
                                           [1,0,0,0],
                                           [1,0,0,0]], 2)
        XCTAssertEqual(value, [0,2])
    }
}

Tests.defaultTestSuite.run()

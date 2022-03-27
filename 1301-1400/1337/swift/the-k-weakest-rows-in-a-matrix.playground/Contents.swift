import Foundation

// 1337. The K Weakest Rows in a Matrix
// https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/

class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var dict: [Int:Int] = [:]
        for i in mat.indices {
            for j in 0..<mat[0].count {
                dict[i, default: 0] += mat[i][j]
            }
        }
        let list = dict.sorted{$0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1}
        return [Int](list.map{$0.0}[0 ..< k])
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /*
        The number of soldiers in each row is:
        - Row 0: 2
        - Row 1: 4
        - Row 2: 1
        - Row 3: 2
        - Row 4: 5
        The rows ordered from weakest to strongest are [2,0,3,1,4].
    */
    func test0() {
        let value = solution.kWeakestRows([[1,1,0,0,0],
                                           [1,1,1,1,0],
                                           [1,0,0,0,0],
                                           [1,1,0,0,0],
                                           [1,1,1,1,1]], 3)
        XCTAssertEqual(value, [2,0,3])
    }
    
    /*
        The number of soldiers in each row is:
        - Row 0: 1
        - Row 1: 4
        - Row 2: 1
        - Row 3: 1
        The rows ordered from weakest to strongest are [0,2,3,1].
    */
    func test1() {
        let value = solution.kWeakestRows([[1,0,0,0],
                                           [1,1,1,1],
                                           [1,0,0,0],
                                           [1,0,0,0]], 2)
        XCTAssertEqual(value, [0,2])
    }
}

Tests.defaultTestSuite.run()

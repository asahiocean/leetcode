import Foundation

// 1572. Matrix Diagonal Sum
// https://leetcode.com/problems/matrix-diagonal-sum/

class Solution {
    func diagonalSum(_ mat: [[Int]]) -> Int {
        var sum = 0
        let len = mat.count
        for a in 0..<len {
            for b in 0..<len where a == b || a + b == len-1 {
                sum += mat[a][b]
            }
        }
        return sum
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Diagonals sum: 1 + 5 + 9 + 3 + 7 = 25
    // Notice that element mat[1][1] = 5 is counted only once.
    func test0() {
        let value = solution.diagonalSum([[1,2,3],
                                          [4,5,6],
                                          [7,8,9]])
        XCTAssertEqual(value, 25)
    }
    
    func test1() {
        let value = solution.diagonalSum([[1,1,1,1],
                                          [1,1,1,1],
                                          [1,1,1,1],
                                          [1,1,1,1]])
        XCTAssertEqual(value, 8)
    }
    
    func test2() {
        let value = solution.diagonalSum([[5]])
        XCTAssertEqual(value, 5)
    }
}

Tests.defaultTestSuite.run()

import Foundation

// 48. Rotate Image
// https://leetcode.com/problems/rotate-image/

class Solution {
    func rotate(_ mat: inout [[Int]]) {
        let len = mat.count
        for i in 0..<len {
            for n in i..<len {
                let tmp = mat[i][n]
                mat[i][n] = mat[n][i]
                mat[n][i] = tmp
            }
            for n in 0..<(len / 2) {
                let tmp = mat[i][n], l = len
                mat[i][n] = mat[i][l - 1 - n]
                mat[i][l - 1 - n] = tmp
            }
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        var arr = [[1,2,3],[4,5,6],[7,8,9]]
        solution.rotate(&arr)
        XCTAssertEqual(arr, [[7,4,1],[8,5,2],[9,6,3]])
    }
    
    func test1() {
        var arr = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
        solution.rotate(&arr)
        XCTAssertEqual(arr, [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]])
    }
}

Tests.defaultTestSuite.run()

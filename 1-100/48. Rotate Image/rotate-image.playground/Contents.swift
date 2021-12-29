import Foundation

// 48. Rotate Image
// https://leetcode.com/problems/rotate-image/

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let length = matrix.count
        for i in 0..<length {
            for n in i..<length {
                let tmp = matrix[i][n]
                matrix[i][n] = matrix[n][i]
                matrix[n][i] = tmp
            }
            for n in 0..<(length / 2) {
                let tmp = matrix[i][n], l = length
                matrix[i][n] = matrix[i][l - 1 - n]
                matrix[i][l - 1 - n] = tmp
            }
        }
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.022 (0.023) seconds

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
    func test2() {
        var arr = [[1]]
        solution.rotate(&arr)
        XCTAssertEqual(arr, [[1]])
    }
    func test3() {
        var arr = [[1,2],[3,4]]
        solution.rotate(&arr)
        XCTAssertEqual(arr, [[3,1],[4,2]])
    }
}

Tests.defaultTestSuite.run()

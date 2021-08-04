import Foundation

// 48. Rotate Image
// https://leetcode.com/problems/rotate-image/

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        (0..<matrix.count).forEach {
            for n in $0..<matrix.count {
                let tmp = matrix[$0][n]
                matrix[$0][n] = matrix[n][$0]
                matrix[n][$0] = tmp
            }
            for n in 0..<(matrix.count / 2) {
                let tmp = matrix[$0][n], l = matrix.count
                matrix[$0][n] = matrix[$0][l - 1 - n]
                matrix[$0][l - 1 - n] = tmp
            }
        }
    }
}

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.022 (0.023) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        var arr = [[1,2,3],[4,5,6],[7,8,9]]
        s.rotate(&arr)
        XCTAssertEqual(arr, [[7,4,1],[8,5,2],[9,6,3]])
    }
    func test1() {
        var arr = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
        s.rotate(&arr)
        XCTAssertEqual(arr, [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]])
    }
    func test2() {
        var arr = [[1]]
        s.rotate(&arr)
        XCTAssertEqual(arr, [[1]])
    }
    func test3() {
        var arr = [[1,2],[3,4]]
        s.rotate(&arr)
        XCTAssertEqual(arr, [[3,1],[4,2]])
    }
}

Tests.defaultTestSuite.run()

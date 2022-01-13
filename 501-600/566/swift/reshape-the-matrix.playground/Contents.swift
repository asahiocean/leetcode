import Foundation

// 566. Reshape the Matrix
// https://leetcode.com/problems/reshape-the-matrix/

class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        
        guard !mat.isEmpty && (mat.count * mat[0].count) == (r * c) && r != mat.count else { return mat }
        
        var result = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
        
        var valM = 0, valN = 0
        
        for row in mat {
            for val in row {
                if valN == c {
                    valM += 1
                    valN = 0
                }
                result[valM][valN] = val
                valN += 1
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.matrixReshape([[1,2],[3,4]], 1, 4)
        XCTAssertEqual(value, [[1,2,3,4]])
    }
    
    func test1() {
        let value = solution.matrixReshape([[1,2],[3,4]], 2, 4)
        XCTAssertEqual(value, [[1,2],[3,4]])
    }
}

Tests.defaultTestSuite.run()

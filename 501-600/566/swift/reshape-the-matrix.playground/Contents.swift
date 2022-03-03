import Foundation

// 566. Reshape the Matrix
// https://leetcode.com/problems/reshape-the-matrix/

class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        guard (mat.count * mat[0].count) == (r * c) else { return mat }
        
        var reshaped = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
        var one = 0, two = 0
        
        for m in mat {
            for n in m {
                if two == c {
                    one += 1
                    two = 0
                }
                reshaped[one][two] = n
                two += 1
            }
        }
        return reshaped
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

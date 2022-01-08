import Foundation

// 931. Minimum Falling Path Sum
// https://leetcode.com/problems/minimum-falling-path-sum/

class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let len = matrix.count, n = matrix[0].count
        if len <= 1 { return len == 0 ? 0 : matrix[0].min()! }
        var mat: [[Int]] = matrix
        for i in 1..<len {
            for j in 0..<n {
                var tmp = mat[i-1][j]
                if j + 1 < n { tmp = min(tmp, mat[i-1][j+1]) }
                if j - 1 >= 0 { tmp = min(tmp, mat[i-1][j-1]) }
                mat[i][j] += tmp
            }
        }
        return mat.last!.min()!
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// There are two falling paths with a minimum sum as shown.
    func test0() {
        let value = solution.minFallingPathSum([[2,1,3],[6,5,4],[7,8,9]])
        XCTAssertEqual(value, 13)
    }
    
    /// The falling path with a minimum sum is shown.
    func test1() {
        let value = solution.minFallingPathSum([[-19,57],[-40,-5]])
        XCTAssertEqual(value, -59)
    }
}

Tests.defaultTestSuite.run()
